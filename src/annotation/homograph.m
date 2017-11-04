function [image,tform, input_points, base_points] = homograph( source, base )

    im1 = imread(source);
    im2 = imread(base);
    [input_points, base_points] = cpselect(im1,im2, 'Wait', true);

    tform = cp2tform(input_points, base_points, 'projective');
    
    image = imtransform(im1, tform);

end

