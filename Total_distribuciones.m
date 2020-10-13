x = [2.242798171 
    3.313978085 
    1.027154664 
    3.463278428 
    5.156914764 
    3.857765105];

pd_rician = fitdist(x,'Rician');
pd_rayleigh = fitdist(x,'Rayleigh');
pd_weibull = fitdist(x,'Weibull');
pd_nakagami = fitdist(x,'Nakagami');
pd_lognormal = fitdist(x,'Lognormal');

x_pdf = [0:0.1:8]; 

y_rician = pdf(pd_rician,x_pdf);   
y_rayleigh = pdf(pd_rayleigh,x_pdf);   
y_weibull = pdf(pd_weibull,x_pdf);   
y_nakagami = pdf(pd_nakagami,x_pdf);   
y_lognormal = pdf(pd_lognormal,x_pdf);  

hold on
line(x_pdf,y_rician)
line(x_pdf,y_rayleigh,'Color','red')
line(x_pdf,y_weibull,'Color','green')
line(x_pdf,y_nakagami,'Color','magenta')
line(x_pdf,y_lognormal,'Color','black')
legend({'Rician','Rayleigh','Weibull','Nakagami', 'Lognormal'});
hold off


