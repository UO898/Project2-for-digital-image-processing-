function y1=adptive_medianfilter(y)
    [m,n]=size(y);
    %% expand image
    Nmax=3;        %set max size
    imgn=padarray(y,[3,3],'symmetric');
    re=imgn;       
    
    %% Process A
    for i=Nmax+1:m+Nmax
        for j=Nmax+1:n+Nmax
            r=1;                
            while r~=Nmax+1    
                W=imgn(i-r:i+r,j-r:j+r);
                W=sort(W(:));           
                Imin=min(W(:));        
                Imax=max(W(:));         
                Imed=W(ceil((2*r+1)^2/2));      
                if Imin<Imed && Imed<Imax       
                   break;
                else
                    r=r+1;              
                end          
            end
            
     %% Process B      
            if Imin<imgn(i,j) && imgn(i,j)<Imax         
                re(i,j)=imgn(i,j);
            else                                       
                re(i,j)=Imed;
            end
        end
    end
%result
y1=re(Nmax+1:m+Nmax,Nmax+1:n+Nmax);
end