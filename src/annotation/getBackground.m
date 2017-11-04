function [ background ] = getBackground( path )

    img = imread(path);
    background = im2bw(img, graythresh(img));
    
end

