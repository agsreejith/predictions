pro interpoltion
h=dblarr(316)
sp=dblarr(316)
result=dblarr(316)
openr,1,"E:\balloon prediction\height.txt"
readf,1,h
openw,2,"n-s bk.txt"
spd1=[0,-21,-38.39998,-25.92,-13.44,-18.78999,-29.91,-20.93999,-9.400001,-3.9,-0.2,2.7,2.2,4.2799997,6.3199997,8.23,9.51999,8.34999,8.92,11.71999,10.38999,8.82,7.12,5.67,5.5099998,5.5099998,5.5099998]
hght1=[0,323.2,540.1,761.7,988.1,1456.7,1946,2465.2,3010.9,3589.2,4264.7,4863.2,5272.1,6341,7182.4,8113.8,9160.1,10358.3,11769.9,13503.2,15790.9,17661.7,19314.2,21629.3,23313.2,25907]
quadterp,hght1(0:26),spd1(0:26),h,sp
print,sp,format='(f18.14)
printf,2,sp
;temp=alt2temp(1000)
;print,temp
end    

pro simu
h=dblarr(8568)
x=dblarr(8568)
y=dblarr(8568)
vx=dblarr(8568)
vy=dblarr(8568)

openr,1,"E:\balloon prediction\heightnew .txt"
readf,1,h
openr,2,"E:\balloon prediction\n-s full.txt"
readf,2,vy
openr,3,"C:\Users\User\Desktop\wind new\e-w full.txt"
readf,3,vx
vx0=0
vy0=0
x0=0
y0=0
for i=0,2556 do begin
temp=alt2temp(h(i))
pres=alt2press(h(i))
rho=(pres/(.2869*temp))
;print,rho
w=3.3
if i gt 2555 then begin
w=1.1
endif
Fxp=((rho*(vx[i]-vx0)^2)*.06*1)
Fxb=((rho*(vx[i]-vx0)^2)*w*1)
Fx=Fxp+Fxb
;print,Fx
ax=Fx/w
;print,ax
;x(i)=(x0+((vx[i]^2-vx0^2)/2*ax))
x(i)=x0+vx0+(ax/2)
;print,x[i]
;print,x0
x0=x[i]
vx0=vx[i]
Fyp=((rho*(vy[i]-vy0)^2)*.06*1)
Fyb=((rho*(vy[i]-vy0)^2)*w*1)
Fy=Fyp+Fyb
ay=Fy/w
y(i)=y0+vy0+(ay/2)
y0=y[i]
vy0=vy[i]
endfor

for i=2557,8567 do begin
temp=alt2temp(h(i))
pres=alt2press(h(i))
rho=(pres/(.2869*temp))
;print,rho
Fxp=((rho*(vx[i]-vx0)^2)*.06*1)
Fxb=((rho*(vx[i]-vx0)^2)*w*1)
;print,Fx
Fx=Fxp+Fxb
ax=Fx/w
;print,ax
;x(i)=(x0+((vx[i]^2-vx0^2)/2*ax))
x(i)=x0+vx0+(ax/2)
;print,x[i]
x0=x[i]
vx0=vx[i]
Fyp=((rho*(vy[i]-vy0)^2)*.06*1)
Fyb=((rho*(vy[i]-vy0)^2)*w*1)
Fy=Fyp+Fyb
ay=Fy/w
y(i)=y0+vy0+(ay/2)
y0=y[i]
vy0=vy[i]
endfor
;plot,h,vx,xtitle='Height in meters',ytitle='Wind velocity in E-W direction in m/s'
;plot,h,vy,xtitle='Height in meters',ytitle='Wind velocity in N-S direction in m/s'
;print,y,format='(f15.5)
;print,x,format='(f15.5)
openw,4,"y.txt"
openw,5,"x.txt"
printf,4,y,format='(f15.5)
printf,5,x,format='(f15.5)
end

