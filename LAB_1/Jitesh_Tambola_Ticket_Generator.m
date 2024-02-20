% Tambola_Ticket_Generator

% Define ranges for each column
numberRanges = {[1 10], [11 20], [21 30], [31 40], [41 50], [51 60], [61 70], [71 80], [81 90]};

% Generate and display 5 lottery tickets
numTicketsToGenerate = 5;

for currentTicketIndex = 1:numTicketsToGenerate
    % Create an empty ticket matrix
    currentTicket = zeros(3, 9);

    % Fill each column with sorted non-repeating numbers from its range
    for currentColumnIndex = 1:9
        currentRange = numberRanges{currentColumnIndex};
        possibleNumbers = currentRange(1):currentRange(2);

        % Determine the number of blank spaces for this column (1 or 2)
        numBlanksInColumn = randi([1, 2]);

        % Randomly select non-blank numbers
        nonBlankNumbers = randsample(possibleNumbers, 3 - numBlanksInColumn);

        % Sort the non-blank numbers and insert blanks
        currentTicket(:, currentColumnIndex) = sort([nonBlankNumbers zeros(1, numBlanksInColumn)]);

        % Shuffle the sorted non-blank numbers within the column
        currentTicket(:, currentColumnIndex) = currentTicket(randperm(3), currentColumnIndex);
    end

    % Display the generated lottery ticket
    disp(['Generated Ticket ' num2str(currentTicketIndex) ':']);
    disp(currentTicket);
    disp(' ');
end
