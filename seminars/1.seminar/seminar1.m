set(gcf, 'Position',  [100, 100, 1500, 800])

prompt = 'Prosimo vnesite številko želenega subjekta: ';
subject = 1;  % Set the subject to the desired value

if isempty(subject)
    subject = 16;
end

if (subject < 10)
    subject = strcat('0', int2str(subject));
else
    subject = int2str(subject);
end

file = strcat('S0', subject, '\S0', subject, 'R01.edf');
disp('Odpiram datoteko: ');
disp(file);
[signals, fs, tm] = rdsamp(file, 1:64);

% Perform Independent Component Analysis (ICA) on the EEG data
[icasig, A, W] = fastica(signals', 'approach', 'symm', 'g', 'tanh');

% Define the number of components to display per tab
components_per_tab = 5;  % Adjust this based on your preference

num_components = size(icasig, 1);
num_tabs = ceil(num_components / components_per_tab);

% Initialize min and max values for y-axis limits across all tabs
y_min_all_tabs = Inf;
y_max_all_tabs = -Inf;

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
            plot(tm, icasig(index, :));
            title(['Independent Component ' num2str(index)]);

            % Update y-axis limits across all tabs
            y_min_all_tabs = min(y_min_all_tabs, min(icasig(index, :)));
            y_max_all_tabs = max(y_max_all_tabs, max(icasig(index, :)));
        end
    end
end

% Set the same y-axis limits for all subplots and tabs
for t = 1:num_tabs
    for i = 1:components_per_tab
        tab = findobj(gcf, 'Type', 'uitab', 'Title', ['Tab ' num2str(t)]);
        axes('Parent', tab);
        subplot(components_per_tab, 1, i);
        ylim([y_min_all_tabs, y_max_all_tabs]);
    end
end


% Identify the independent component(s) corresponding to eye artifacts
% You may need to visualize the independent components and manually select the ones related to eye artifacts
% For example, you can plot each independent component using plot(icasig(:, i))
% Replace 'i' with the index of the independent component you want to visualize

% Manually identify the components related to eye artifacts
% Replace 'eye_artifact_components' with the indices of components related to eye artifacts
%eye_artifact_components = [1, 2]; % Adjust this based on your observation

% Remove the selected components from the independent components
%icasig(:, eye_artifact_components) = 0;

% Reconstruct the corrected EEG data
%eeg_corrected = icasig * A * signals';

% Visualize the original and corrected signals
figure;

% Plot original EEG signals
subplot(2, 1, 1);
plot(tm, signals);
title('Original EEG Signals');

% Plot corrected EEG signals
%subplot(2, 1, 2);
%plot(tm, eeg_corrected');
%title('Corrected EEG Signals');

% Save the corrected signals if needed
% save('path/to/save/corrected_signals.mat', 'eeg_corrected');
