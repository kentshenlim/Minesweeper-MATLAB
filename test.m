clear all
close all
mat = zeros(8,10);
numberOfMine = 10;
count = 0;
while (count < 10)
    x = randi([1,8]);
    y = randi([1,10]);
    if (mat(x,y) == 0)
        mat(x,y) = 1;
        count = count + 1;
        disp('Okay')
    end
end