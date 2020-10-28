function g = twodConv4e(f,w)
f=double(f);
[f1,f2]=size(f);
s = intScaling4e(f,"default","floating"); %To have input image in the range of 0 to 1

[s1,s2] = size(s);
[w1,w2]=size(w);
g=zeros(s1+w1-1,s2+w2-1); %Initializing Final image
% [g1, g2]=size(g);
%replicate padding of original image
p1=(w1-1)/2;
p2=(w2-1)/2;
b=padarray(s,[p1,p2],'replicate','both');
[b1,b2] = size(b);

%Flipping the mask for convolution
w=rot90(w,2); % Rotating by 180degree

%Applying the mask
% for i=1:b1-p1
%     for j=1:b2-p2
%         for x=1:w1
%             for y=1:w2  
% %                 z1=abs(i-w1);
% %                 z2=abs(i-w2);
% %                 disp("z1: "+z1)
% %                 disp("z2: "+z2)
%                 g(i+p1,j+p2)=g(i+p1,j+p2)+b(i+p1-1,j+p2-1)*w(x,y);
%             end
%         end
%     end
% end

%3x3 Case
% for i=1:b1-p1-1
%     for j=1:b2-p2-1
%         for x=1:w1
%             for y=1:w2  
%                  %g(i+p1,j+p2)=g(i+p1,j+p2)+b(x+i-1,y+j-1)*w(x,y);
%                  g(i+1,j+1)=g(i+1,j+1)+b(i+1-p1+x-1,j+1-p2+y-1)*w(x,y);
%             end
%         end
%     end
% end

%General Case
for i=1:f1
    for j=1:f2
        for x=1:w1
            for y=1:w2  
                 %g(i+p1,j+p2)=g(i+p1,j+p2)+b(x+i-1,y+j-1)*w(x,y);
                 g(i+p1,j+p2)=g(i+p1,j+p2)+b(i+x-p1+1,j+y-p2+1)*w(x,y);
            end
        end
    end
end