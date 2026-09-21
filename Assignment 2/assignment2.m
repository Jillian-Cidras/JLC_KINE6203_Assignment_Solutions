%Jillian Cidras
%9/20/2026
%Interactive game of Tic Tac Toe

clc;
disp("Hello! Welcome to the wonderful game of Tic Tac Toe!")
prompt = input('Would you like to play? Please type yes or no and press enter: ', "s");
if strcmpi(prompt,'no')
    disp('Maybe another time! Goodbye.')
elseif strcmpi(prompt,'yes')
    board = ["1", "2", "3"; "4", "5", "6"; "7", "8", "9"];
    disp(board)
    disp("Awesome. Here is the game board.")
    disp("Each number corresponds with a spot on the board.")
    turn = input("Would you like to go first or second? Please type 1 or 2: ");
    gameOver = false;

    while gameOver == false
        if turn == 1  %person inputs this
            move = input('Enter your move (1-9): ');
            while move < 1 || move > 9 % this checks that number is between 1 and 9 %Human turn
                disp('Invalid move. Please choose a number from 1 to 9.')
                move = input('Enter your move (1-9): ');
            end
            if move == 1       %converts the number move to row and column
                row = 1;
                col = 1;
            elseif move == 2
                row = 1;
                col = 2;
            elseif move == 3
                row = 1;
                col = 3;
            elseif move == 4
                row = 2;
                col = 1;
            elseif move == 5
                row = 2;
                col = 2;
            elseif move == 6
                row = 2;
                col = 3;
            elseif move == 7
                row = 3;
                col = 1;
            elseif move == 8
                row = 3;
                col = 2;
            elseif move == 9
                row = 3;
                col = 3;
            end
            if board(row,col) ~= "X" && board(row,col) ~= "O" %if the board row/columns do not have a O or X already
                board(row,col) = "X";
                disp(board)
                turn = 2;
            else
                disp('That spot is already taken. Try again.')
            end

        elseif turn == 2 %turn==2 is the computer turn
            for i = 1:9
                computerMove = randi([1,9]); %using randi to have computer pick a number between 1 and 9
                if computerMove == 1 %need to make the number selected onto the matrix
                    row = 1;
                    col = 1;
                elseif computerMove == 2
                    row = 1;
                    col = 2;
                elseif computerMove == 3
                    row = 1;
                    col = 3;
                elseif computerMove == 4
                    row = 2;
                    col = 1;
                elseif computerMove == 5
                    row = 2;
                    col = 2;
                elseif computerMove == 6
                    row = 2;
                    col = 3;
                elseif computerMove == 7
                    row = 3;
                    col = 1;
                elseif computerMove == 8
                    row = 3;
                    col = 2;
                elseif computerMove == 9
                    row = 3;
                    col = 3;
                end

                if board(row,col) ~= "X" && board(row,col) ~= "O" %make sure the computers move if open, if not
                    board(row,col) = "O";
                    disp("Computer's move:") %displays the computers move to user
                    disp(board)
                    turn = 1;
                    break
                end
            end
        end
        %Need to make the checks for wins
        for i = 1:3        % Check rows for wins
            if board(i,1) == board(i,2) && board(i,2) == board(i,3)
                disp("We have a winner winner chicken dinner! Is it you?")
                gameOver = true;
                break %the break helps break the loop. so it can get out of possibly multiple spots being open.
            end
        end
        for i = 1:3 % Check columns for wins
            if board(1,i) == board(2,i) && board(2,i) == board(3,i)
                disp("We have a winner winner chicken dinner! Is it you?")
                gameOver = true;
                break %need to use this again
            end
        end
        if board(1,1) == board(2,2) && board(2,2) == board(3,3) % Check diagonals for wins
            disp("We have a winner winner chicken dinner! Is it you?")
            gameOver = true;

        elseif board(1,3) == board(2,2) && board(2,2) == board(3,1)
            disp("We have a winner winner chicken dinner! Is it you?")
            gameOver = true;
        end
    end

    disp("Thanks for playing! If you want to play again you can click anywhere into the above section of code and press Run section ")

end
