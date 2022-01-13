function [thd1,thd2] = find_threshold(img,threshold1, threshold2)
% find the size of image
[M, N] = size(img(:, :, 1));

% channel spearation
img_r=double(img(:, :, 1));
img_g=double(img(:, :, 2));
img_b=double(img(:, :, 3));


window_size=3;
diff=zeros((M-window_size+1)*(N-window_size+1),1);

for i = fix(window_size/2)+1 : M-fix(window_size/2)
    for j = fix(window_size/2)+1 : N-fix(window_size/2)
        
        psum=double(1);
        for m = 0 : window_size-1
            for n = 0 : window_size-1
                psum=psum+0.333*sqrt((abs(img_r(i,j)-img_r(i-fix(window_size/2)+m,j-fix(window_size/2)+n))).^2+(abs(img_r(i,j)-img_g(i-fix(window_size/2)+m,j-fix(window_size/2)+n))).^2+(abs(img_r(i,j)-img_b(i-fix(window_size/2)+m,j-fix(window_size/2)+n))).^2);
            end
        end
        
        diff((i-fix(window_size/2)-1) *(N-window_size+1)+j-fix(window_size/2))=(1/9)*psum;
    end
end

diff=sort(diff);
thd1=diff(round(threshold1*size(diff,1)));
thd2=diff(round(threshold2*size(diff,1)));
end

