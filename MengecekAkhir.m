function MengecekAkhir()
    % Memanggil variabel global
    global sumP1
    global sumP2
    global Winner
    global Game
    global Board
    
    % Mencari tahu pemenang game congklak
    if sumP1 == 0 && sumP2 == 0
        if Board(2,8) > Board(1,8)
            Winner = 1;
        elseif Board(2,8) < Board(1,8)
            Winner = 2;
        elseif Board(2,8) == Board(1,8)
            Winner = 0; 
        end
        Game = 0;
    % Apabila sawah belum habis, mengganti giliran
    elseif sumP1 ~= 0 || sumP2~= 0
        Game = 1;
    end
end