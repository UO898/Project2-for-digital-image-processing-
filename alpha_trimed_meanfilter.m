function [y1] = alpha_trimed_meanfilter(y)
        [MM,NN]=size(y);
        %set m,n
        m=3;
        n=3;
        len_m=floor(m/2);
        len_n=floor(n/2);
        %expand image
        I_D_pad=padarray(y,[len_m,len_n],'symmetric');
        [M,N]=size(I_D_pad);
        d=7;
        y1=zeros(MM,NN);
        %filtering
        for i=1+len_m:M-len_m
            for j=1+len_n:N-len_n
                Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
                Block=sort(Block(:));
                Block=Block(floor(d/2+1):floor(m*n-4));      
                y1(i-len_m,j-len_n)=sum(sum(Block))/(m*n-d);
            end
        end
end