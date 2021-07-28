function MenggantiGiliran()
    % Memanggil variabel global
    global Game;
    global Player;
    global Repeat;
    global ChangeTurn;
    global Area;
    global ChooseHole;
    global X;
    global Hole;
    
    % Mengganti Giliran Pemain
    if Game == 1 && Player == 1
        Player = 2;
        Repeat = 1;
        ChangeTurn = 0;
        Area = 1;
        ChooseHole = 1;
        X = 0;
        Hole = 0;
    elseif Game == 1 && Player == 2
        Player = 1;
        Repeat = 1;
        ChangeTurn = 0;
        Area = 2;
        ChooseHole = 1;
        X = 0;
        Hole = 0;
    end
end