% Constants
dlgtitle = 'Input';
fieldsize = [1 45];
options.WindowStyle='normal';

prompt = 'Please select the subject: ';
%subject = 1;  
subject = inputdlg(prompt,dlgtitle,fieldsize);

if isempty(subject),return,end % Bail out if they clicked Cancel.
% Round to nearest integer in case they entered a floating point number.
subject = round(str2double(cell2mat(subject)));
% Check for a valid integer.
if isnan(subject) || or(subject>109, subject<1)
    % They didn't enter a number.  
    % They clicked Cancel, or entered a character, symbols, or something else not allowed.
    message = sprintf('Wrong input %d.', subject);
    uiwait(warndlg(message));
    return
end

subjectStr = sprintf('%03d', subject);  % Ensure a leading zero

prompt = 'Please select the experiment: ';
%experiment = 1;  
experiment = inputdlg(prompt,dlgtitle,fieldsize);

if isempty(experiment),return,end; % Bail out if they clicked Cancel.
% Round to nearest integer in case they entered a floating point number.
experiment = round(str2double(cell2mat(experiment)));
% Check for a valid integer.
if isnan(experiment) || or(experiment>14, experiment<1)
    % They didn't enter a number.  
    % They clicked Cancel, or entered a character, symbols, or something else not allowed.
    message = sprintf('Wrong input %d.', experiment);
    uiwait(warndlg(message));
    return
end


experimentStr = sprintf('%02d', experiment);  % Ensure two leading zeros

filename = strcat('S', subjectStr, '\S', subjectStr, 'R', experimentStr, '.edf');
disp('Opening file: ');
disp(filename);

[signals, fs, tm] = rdsamp(filename, 1:64);

% Perform Independent Component Analysis (ICA) on the EEG data
[icasig, A, W] = fastica(signals', 'approach', 'symm', 'g', 'tanh');

% Define the number of components to display per tab
components_per_tab = 1;  

num_components = size(icasig, 1);
num_tabs = ceil(num_components / components_per_tab);

% Initialize min and max values for y-axis limits across all tabs
y_min_all_tabs = Inf;
y_max_all_tabs = -Inf;

% Calculate the global y-axis limits across all components
for i = 1:num_components
    y_min_all_tabs = min(y_min_all_tabs, min(icasig(i, :)));
    y_max_all_tabs = max(y_max_all_tabs, max(icasig(i, :)));
end

% Determine the common y-axis limits for all components
y_min_all_tabs = min(icasig(:));
y_max_all_tabs = max(icasig(:));

% Visualize individual independent components in separate tabs
for t = 1:num_tabs
    % Create a new tab
    tab = uitab('Title', ['Tab ' num2str(t)]);

    % Create axes for the tab
    axes('Parent', tab);

    % Plot components in the current tab
    for i = 1:components_per_tab
        index = (t - 1) * components_per_tab + i;
        if index <= num_components
            subplot(components_per_tab, 1, i);

            % Plot the independent component
            plot(tm, icasig(index, :));
            title(['Independent Component ' num2str(index)]);
            
            % Set the y-axis limits for the current subplot based on the common range
            ylim([y_min_all_tabs, y_max_all_tabs]);
        end
    end
end

set(gcf, 'Position', get(0, 'Screensize'));

% Identify the independent component(s) corresponding to eye artifacts
prompt = 'Please select the eye artifact components to be removed, seperated with spaces.';
eye_artifact_components = inputdlg(prompt,dlgtitle,fieldsize,{''},options);

if isempty(eye_artifact_components),return,end; % Bail out if they clicked Cancel.
eye_artifact_components = str2num(eye_artifact_components{:});

disp('Removing eye artifact components: ');
disp(eye_artifact_components);


% Set the identified components to zero in the independent components matrix
icasig(eye_artifact_components, :) = 0;

% Adjust the corresponding rows in the mixing matrix (A) to maintain consistency
A_adjusted = A;
A_adjusted(:, eye_artifact_components) = 0;

% Reconstruct the corrected EEG data
eeg_corrected = A_adjusted * icasig;

% Transpose the result
eeg_corrected = eeg_corrected';


% Visualize the original and corrected signals
figure;

% Plot original EEG signals
subplot(2, 1, 1);
plot(tm, signals);
title('Original EEG Signals');

% Plot corrected EEG signals
subplot(2, 1, 2);
plot(tm, eeg_corrected);
title('Corrected EEG Signals');
set(gcf, 'Position', get(0, 'Screensize'));
