%input image and filter type
function [y1] = imfilters(y,type)
    switch type
        case 'meanfilter'
            h=fspecial('average',3);
            y1=imfilter(y,h,'symmetric');
        case 'gaussfilter'
            y1=imgaussfilt(y,0.5,'Padding','symmetric');
        case 'medianfilter'
            y1=medfilt2(y,'symmetric');
        case 'alpha-trimed meanfilter'
            y1=alpha_trimed_meanfilter(y);
        case 'adptive medianfilter'
            y1=adptive_medianfilter(y);
        otherwise
            disp('Invaild Input');
            y1=y;
    end

end