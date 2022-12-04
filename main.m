clear,clc;
filename='01.png';
noise_leval = [10,20,50,100,200];
filter_type=["meanfilter","gaussfilter","medianfilter","alpha-trimed meanfilter","adptive medianfilter"];
PSNRs=zeros(length(filter_type),length(noise_leval));
SSIMs=zeros(length(filter_type),length(noise_leval));
 for ii = 1:length(filter_type)
    disp(filter_type(ii));
    for jj = 1:length(noise_leval)
        %set noise density
        sigma = noise_leval(jj);
        originImage = im2double(imread(filename));
        % add salt-and-pepper noise
        imageWithNoise = imnoise(originImage,'salt & pepper',sigma*0.001);
        y = imageWithNoise;
        y1=imfilters(y,filter_type(ii));
        %write results
        %name=strcat(num2str(ii),num2str(jj),'.png');
        %imwrite(y1,name);
        % calculate psnr,ssim
        PSNRs(ii,jj) = psnr(im2uint8(originImage), im2uint8(y1));
        SSIMs(ii,jj) = ssim(im2uint8(originImage), im2uint8(y1));
        %show results
        figure(jj);
        imshow(cat(2,im2uint8(originImage),im2uint8(imageWithNoise),im2uint8(y1)));
        title(['sigma=',num2str(sigma),'  ','  psnr=',num2str(PSNRs(ii,jj),'%2.2f'),'dB','  ssim=',num2str(SSIMs(ii,jj),'%2.4f')])
        disp(["sigma:",sigma,"psnr:",PSNRs(ii,jj),"ssim:", SSIMs(ii,jj)]);
        pause(0.5);
    end
 end
% write results
% writematrix(PSNRs,'PSNRs.xls');
% writematrix(SSIMs,'SSIMs.xls');
