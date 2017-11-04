function image = plotOffside(path1,pathbase)

    %path1 = 'C:\Users\Tosh\Desktop\rvau\images\ronaldo.jpg';
    %pathbase = 'C:\Users\Tosh\Desktop\rvau\images\field.jpg';

    im1 = imread(path1);
    image = im1;
    
    imbase = imread(pathbase);
    
    %calcular homografia e transformação para imagem base
    [homog, tform, input_points, base_points] = homograph(path1,pathbase); 
    
    close all;
    imshow(im1);
    
    
    %pedir ponto do offside
    [x, y] = ginput(1);
    
    %projectar o ponto na imagem base (field)
    [x1,y1] = tformfwd(tform, x, y);
    
   
    
    %calcular o ponto perpendicular ao ponto dado na linha superior do campo,
    %( y = 0 ) da imagem base, ao ponto do offside
    %de modo a poder desenhar uma linha paralela
    [xfinal, yfinal] = tforminv(tform, x1, 0);
    
    
    %valores para calcular a linha para toda a imagem
    %xaux1 = 0;
    %yaux1 = m*xaux1 + b;
    
    %yaux2 = 0; 
    %xaux2 = (yaux2 - b) / m;
      
    %check if points are out of picture, then replace them if so
    %if( yaux1 > size(im1,1))
    %    yaux1 = size(im1,1);
    %    xaux1 = (yaux1 - b) / m;
    %elseif ( yaux1 < 0)
    %    yaux1 = 0;
    %    xaux1 = (yaux1 - b) / m;
    %end
        
    %if( xaux2 > size(im1,2))
    %    xaux2 = size(im1,2);
    %    yaux2 = m*xaux2 + b;
    %elseif ( xaux2 < 0)
    %    xaux2 = 0;
    %    yaux2 = m*xaux2 + b;
    %end    
        
    
    %if direction
        %patch([xaux1,xaux2,],[yaux1,yaux2,0], 'r', 'FaceAlpha', 0.3, 'EdgeColor' , 'none');
    %else
        
        %patch([xaux1,xaux2,0],[yaux1,yaux2,0], 'r', 'FaceAlpha', 0.3, 'EdgeColor' , 'none');
    %end
    
    
    background = getBackground(path1);
    
    %desenhar a linha
    
    %detectar direção de jogo
    direction = (x1 > size(imbase,2)/2);
    
    
    %equação da reta para prolongar a linha para todo o campo
    m = (yfinal - y) / (xfinal - x);
    b = y - m * x;
    
    
    %simplificação do problema dos vertices exactos da reta através de
    %valores exageradamente grandes
    
    xaux1 = x - 2500;
    yaux1 = m*xaux1 + b;
    
    xaux2 = x + 2500;
    yaux2 = m*xaux2 + b;
    
    imshow(im1);
    hold on;
        
    draw_line2(xaux1,yaux1,xaux2,yaux2,'y', background);
    %draw_line2_test(0,100,0,200,'y', background);

    
    hold off;
    
    %figure, imshow(background);
end

