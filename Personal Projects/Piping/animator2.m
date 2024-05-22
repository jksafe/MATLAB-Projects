function animator2(frames,alphaFrames,filename)
nFrames=size(frames,4);

for i1=1:nFrames
    active=frames(:,:,:,i1);
    imshow(active);
    alpha('scaled');
    alpha(alphaFrames(:,:,i1));
    if i1==1
        temp=getframe(gcf);
        temp=frame2im(temp);
        [temp,map]=rgb2ind(temp,256);
        imwrite(temp,map,filename,"gif","LoopCount",Inf,"DelayTime",0.2);
    else
        temp=getframe(gcf);
        temp=frame2im(temp);
        [temp,map]=rgb2ind(temp,256);
        imwrite(temp,map,filename,"gif","WriteMode","append","DelayTime",0.2);
    end

%{
    exportgraphics(gca,'temp.png');
    im=imread('temp.png');
    im=imresize(im,[560 730]);
    writeVideo(v,im);
%}

end
%close(v)
end