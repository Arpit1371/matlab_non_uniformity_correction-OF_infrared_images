
%% intitializing
fig_name = 'Fig1.png';  %%%%///// change file name here
file_type = 'png';

dat = 'data/';

source  =  strcat(dat,fig_name) ;


fig = imread(source,file_type); %%%% //// change png to jpg for jpg file
fig =  im2gray(fig) ;

rows = size(fig,1) ;
col = size(fig, 2) ;
%imshow(fig)

fig = double(fig)/1;








%converting to 1D image array

fig = fig';
fig = fig(:)';



 


sigma_min = 0 ;
sigma_max = 8 ;
delta = 0.5;

c = col + 8*sigma_max ;
Imsym = zeros(1,c* rows);

Imsym = borders(fig, Imsym , col , rows , 4*sigma_max);






%% transfering_data_to_central_func

Imsym = MIRE_automatic(Imsym,c,rows,sigma_min, sigma_max, delta);

%% Crop

for c = 0:col-1
    for l = 0: rows-1
        fig(l*col +c +1) = Imsym(l *( col + 8*sigma_max)+ c + 4*sigma_max +1 ) ;
    end
end



%% dynamic_correction

min = min(fig);
max = max(fig);

for i =1: col*rows-1 
    fig(i+1) = 255 * (fig(i+1) - min)/(max-min);
end

%% Output

output  = zeros(rows,col) ;


for i = 0: rows-1
    for j = 0:col -1
        output(i+1,j+1) = round(fig(i*col + j +1 ));
    end
end
% Typecasted to uint8 
output = uint8(output); 
% Display your image
output; imshow(output, []);






