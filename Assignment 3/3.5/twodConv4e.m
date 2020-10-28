function g = twodConv4e(f,w)
f=double(f);
%Disabling automatic scaling
m2 = max(max(f));
if m2>1
    s = intScaling4e(f,"default","floating"); %To have input image in the range of 0 to 1
end
if m2<=1
    s=f;
end
[s1,s2] = size(s);
[w1,w2]=size(w); %Size of mask
g1=zeros(s1+w1-1,s2+w2-1); %Initializing Final image

%replicate padding of original image
p1=ceil((w1-1)/2);
p2=ceil((w2-1)/2);
b=padarray(s,[p1,p2],'replicate','both');

%Flipping the mask for convolution
w=rot90(w,2); % Rotating by 180degree

%General Case for convolution
for i=1:s1
    for j=1:s2
                 g1(i+p1,j+p2)=sum(sum(w.*b(i:i+w1-1,j:j+w2-1)));
    end
end

%Removing zero padding and scaling
g=g1(p1+1:end-p1,p2+1:end-p2);