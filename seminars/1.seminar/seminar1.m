prompt = 'Please select the subject: ';
%subject = 1;  % Set the subject to the desired value
subject = input(prompt);  % Set the subject to the desired value

if isempty(subject)
    subject = 1;
end

subjectStr = sprintf('%03d', subject);  % Ensure a leading zero

prompt = 'Please select the experiment: ';
%experiment = 1;  % Set the experiment to the desired value
experiment = input(prompt);  % Set the experiment to the desired value

if isempty(experiment)
    experiment = 1;
end

experimentStr = sprintf('%02d', experiment);  % Ensure a two leading zeros

file = strcat('S', subjectStr, '\S', subjectStr, 'R', experimentStr, '.edf');
disp('Opening file: ');
disp(file);
[signals, fs, tm] = rdsamp(file, 1:64);

% Perform Independent Component Analysis (ICA) on the EEG data
[icasig, A, W] = fastica(signals', 'approach', 'symm', 'g', 'tanh');

% Define the number of components to display per tab
components_per_tab = 1;  % Adjust this based on your preference

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

            % Plot the independent component without scaling
            plot(tm, icasig(index, :));
            title(['Independent Component ' num2str(index)]);
            
            % Set the y-axis limits for the current subplot based on the common range
            ylim([y_min_all_tabs, y_max_all_tabs]);
        end
    end
end


% Identify the independent component(s) corresponding to eye artifacts
% You may need to visualize the independent components and manually select the ones related to eye artifacts

prompt = 'Please select the eye artifact components to be removed with an [] around them: ';
%eye_artifact_components = [10, 15, 22, 32]; % Based on my observation
%eye_artifact_components = [22, 24, 26, 28, 30, 32, 36, 38]; % Based on electrodes placement
%eye_artifact_components = 1;  % Set the experiment to the desired value
eye_artifact_components = input(prompt);  % Set the experiment to the desired value
disp('Removing eye artifact components: ');
disp(eye_artifact_components);


% Set the identified components to zero in the independent components matrix
icasig(eye_artifact_components, :) = 0;

% Adjust the corresponding rows in the mixing matrix (A) to maintain consistency
A_adjusted = A;
A_adjusted(:, eye_artifact_components) = 0;

% Reconstruct the corrected EEG data
eeg_corrected = A_adjusted * icasig;

% Transpose the result to have dimensions [num_samples, num_components]
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
