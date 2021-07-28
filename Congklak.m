function Congklak
    % [PROGRAM GAME CONGKLAK]
    % Kelompok : 13
    % Anggota Kelompok  : 16919140 / Kafi Mahardika
    %                     16919168 / Andrew Tanuwijaya
    %                     16919196 / Hidratama Azmirafi
    %                     16919276 / Avicenna Najib Mahmud
    
    % ----------------------------------------------------------------------- %

    % Menghilangkan command window dan variabel yang ada sebelumnya
    clear all
    clc
    % Memberi beberapa info mengenai game Congklak
    fprintf('CARA BERMAIN CONGKLAK\n\n')
    fprintf('Game tediri atas 2 pemain\n')
    fprintf('Pemain mengambil batu dari areanya masing-masing lalu ')
    fprintf('memindahkannya ke sawah berikutnya searah jarum jam\n')
    fprintf('Mengganti pemain apabila pemain telah menembak sawah lawan ')
    fprintf('atau menembak sawah sendiri\n') 
    fprintf('Permainan berakhir apabila jumlah biji pada sawah 0\n')
    fprintf('Pemenangnya adalah yang mengumpulkan biji terbanyak\n\n')
    fprintf('SELAMAT BERMAIN\n\n')
    
    % Menentukan variabel global awal
    global Board;
    Board = zeros(2,8);
    for i = 1:2
        for j = 1:7
            Board(i,j) = 7;
        end
    end
    global Winner; Winner = 0;
    global Player; Player = 1;
    global Tangan; Tangan = 0;
    global Hole; Hole = 0;
    global Repeat; Repeat = 1;
    global Game; Game = 1;
    global ChangeTurn; ChangeTurn = 0;
    global Area; Area = 2;
    global sumP1; sumP1 = 0;
    global sumP2; sumP2 = 0;
    global X; X = 0;
    global Y; Y = 0;
    global ChooseHole; ChooseHole = 1;
    global Count; Count = 0;

    % ----------------------------------------------------------------------- %
    % [ ALGORITMA PROGRAM ] 

    % Melakukan loop hingga ditemukan pemenangnya
    while Game == 1
        % Looping untuk Player 1
        while Player == 1 && Repeat == 1 && ChangeTurn == 0
            % Permainan dilakukan di Area 2 (Player 1)
            while Area == 2 && ChangeTurn == 0
                % Apabila di tangan tidak ada batu, player memilih batu
                if Tangan == 0 && ChooseHole == 1 && Hole == 0
                    disp(Board)
                    fprintf('Player %d, pilih lubang: ', Player);
                    Hole = input('');
                    Count = 0;
                end
                % Apabila batu di tangan habis sebelum sampai lumbung
                if Tangan == 0 && Hole >= 1
                    % Apabila setelah ditambahkan sama dengan 1, menembak sawah
                    % lawan
                    if Board(2,Hole) == 1 && Tangan == 0 && Count > 0
                        fprintf('Menembak sawah Lawan!\n')
                        Tangan = Board(2,Hole) + Board(1,Hole);
                        Board(2,Hole) = 0;
                        Board(1,Hole) = 0;
                        Board(2,8) = Board(2,8) + Tangan;
                        Tangan = 0;
                        fprintf('Mengganti Giliran\n')
                        ChangeTurn = 1;
                        Repeat = 0;
                        disp(Board)
                        Hole = 0;
                    % Apabila setelah ditambahkan lebih dari 1, mengambil batu
                    elseif Board(2,Hole) >= 1 && Tangan == 0
                        Tangan = Board(2,Hole);
                        Board(2,Hole) = 0;
                        disp(Board)
                    end
                end
                % Apabila masih terdapat batu di tangan, menggeser ke kiri
                while Tangan > 0 && Hole > 1
                    Hole = Hole - 1;
                    Tangan = Tangan - 1;
                    Board(2,Hole) = Board(2,Hole) + 1;
                    disp(Board)
                    Count = Count + 1;
                end
                % Apabila batu sampai ujung, menambahkan 1 pada lumbung
                if ChangeTurn == 0 && Hole == 1 && Tangan > 0
                    Board(2,8) = Board(2,8) + 1;
                    Tangan = Tangan - 1;
                    disp(Board)
                    disp(Tangan)
                    Y = 1;
                end
                % Apabila batu habis pada lumbung, mengambil batu kembali
                % dengan cara mengulang proses dari atas
                if Tangan == 0 && ChangeTurn == 0 && Y == 1
                    fprintf('Habis di lumbung sendiri\n')
                    ChooseHole = 1;
                    Repeat = 1;
                    Y = 0;
                    Hole = 0;
                % Apabila tangan lebih dari 0, melanjutkan permainan ke Area 1
                elseif Tangan > 0
                    Area = 1;
                    Y = 0;
                end
            end

            % --------------------------------------------------------------- %

            % Looping pada Area 1
            while Area == 1 && ChangeTurn == 0
                % Apabila batu di tangan habis
                if Tangan == 0 && Hole <= 7
                    % Apabila setelah ditambahkan == 1, menembak sawah sendiri
                    % dan mengganti giliran
                    if Board(1,Hole) == 1
                        fprintf('Menembak sawah sendiri\n')
                        fprintf('Mengganti giliran\n')
                        Hole = 0;
                        ChangeTurn = 1;
                    % Apabila setelah ditambahkan > 0, mengambil batu
                    elseif Board(1,Hole) > 1
                        Tangan = Board(1,Hole);
                        Board(1,Hole) = 0;
                        disp(Board)
                    end
                    % Menambahkan lubang untuk menargetkan lubang selanjutnya
                    Hole = Hole + 1;
                end
                % Apabila masih terdapat batu pada tangan, menggeser ke kanan
                while Tangan > 0 && Hole < 8
                    Board(1,Hole) = Board(1,Hole) + 1; 
                    Tangan = Tangan - 1;
                    Hole = Hole + 1;
                    disp(Board)
                    X = 1;
                end
                if X == 1 
                    Hole = Hole - 1;
                    X = 0;
                end
                % Apabila tangan belum habis, melanjutkan ke Area 2
                if Tangan > 0
                    Hole = 8;
                    Area = 2;
                    ChooseHole = 0;
                end
            end 
        end
        disp(Board)

        % ------------------------------------------------------------------- %

        % Looping untuk player 2
        while Player == 2 && Repeat == 1 && ChangeTurn == 0
            % Looping Area 1
            while Area == 1 && ChangeTurn == 0
                % Apabila di tangan == 0, memilih lubang
                if Tangan == 0 && ChooseHole == 1 && Hole == 0
                    fprintf('Player %d, pilih lubang: ', Player);
                    Hole = input('');
                    Count = 0;
                end
                % Apabila batu ditangan habis
                if Tangan == 0 && Hole <= 7
                    % Apabila setelah ditambahkan sama dengan 1, menembak
                    if Board(1,Hole) == 1 && Count > 0
                        fprintf('Menembak sawah lawan!\n')
                        Tangan = Board(1,Hole) + Board(2,Hole);
                        Board(2,Hole) = 0;
                        Board(1,Hole) = 0;
                        Board(1,8) = Board(1,8) + Tangan;
                        Tangan = 0;
                        fprintf('Mengganti giliran\n')
                        ChangeTurn = 1;
                        Hole = 0;
                        disp(Board)
                    % Apabila setelah ditambahkan lebih dari 1, mengambil batu
                    elseif Board(1,Hole) >= 1
                        Tangan = Board(1,Hole);
                        Board(1,Hole) = 0;
                        disp(Board)
                    end
                    Hole = Hole + 1;
                end
                % Apabila masih terdapat batu pada tangan, melakukan looping
                while Tangan > 0 && Hole < 8
                    Board(1,Hole) = Board(1,Hole) + 1; 
                    Tangan = Tangan - 1;
                    Hole = Hole + 1;
                    disp(Board)
                    Count = Count + 1;
                    X = 1;
                end
                if X == 1 || Hole == 8
                    Hole = Hole - 1;
                    X = 0;
                end
                % Apabila batu telah sampai ujung, menambahkan batu pada
                % lumbung
                if ChangeTurn == 0 && Hole == 7 && Tangan > 0
                    Board(1,8) = Board(1,8) + 1;
                    Tangan = Tangan - 1;
                    disp(Board)
                    Y = 1;
                end
                % Apabila habis di lumbung, memilih lubang kembali dengan cara 
                % mengulang proses di atas
                if Tangan == 0 && Hole == 7 && Y == 1
                    fprintf('Habis di lumbung sendiri\n')
                    Repeat = 1;
                    ChooseHole = 1;
                    X = 0;
                    Y = 0;
                    Hole = 0;
                % Apabila masih terdapat batu pada tangan, lanjut ke Area 2
                elseif Tangan > 0
                    Area = 2;
                    Hole = 8;
                    ChooseHole = 0;
                    Y = 0;
                end
            end

            % --------------------------------------------------------------- %

            % Looping Area 2
            while Area == 2 && ChangeTurn == 0
                % Apabila batu habis
                if Tangan == 0 && Hole >= 1
                    % Apabila setelah ditambahkan = 1, menembak sawah sendiri
                    % dan mengganti giliran
                    if Board(2,Hole) == 1
                        fprintf('Menembak sawah sendiri\n')
                        fprintf('Mengganti giliran\n')
                        Hole = 0;
                        ChangeTurn = 1;
                    % Apabila setelah ditambahkan lebih dari 1, mengambil batu
                    elseif Board(2,Hole) > 1
                        Tangan = Board(2,Hole);
                        Board(2,Hole) = 0;
                        disp(Board)
                    end
                end
                % Apabila masih terdapat batu pada tangan, menggeser ke kiri
                while Tangan > 0 && Hole > 1
                    Hole = Hole - 1;
                    Tangan = Tangan - 1;
                    Board(2,Hole) = Board(2,Hole) + 1;
                    disp(Board)
                end
                % Apabila masih terdapat batu pada tangan, pindah ke Area 1
                if Tangan > 0
                    Area = 1;
                    ChooseHole = 0;
                    X = 0;
                end
            end 
        end

        % ------------------------------------------------------------------- %

        % Mengecek akhir permainan
        sumP1 = 0;
        sumP2 = 0;
        for i = 1:7
            sumP1 = sumP1 + Board(2,i);
            sumP2 = sumP2 + Board(1,i);
        end
        % Memanggil Prosedur untuk Mengecek Akhir permainan
        MengecekAkhir();
        % Memanggil prosedur untuk mengganti giliran
        MenggantiGiliran();
    end

    % ----------------------------------------------------------------------- %

    % Apabila Game selesai, mencetak pemenang
        if Game == 0
            if Winner == 1
                fprintf('Player 1 memenangkan Game Congklak\n')
            elseif Winner == 2
                fprintf('Player 2 memenangkan Game Congklak\n')
            elseif Winner == 0
                fprintf('Permainan berakhir seri')
            end 
        end
end