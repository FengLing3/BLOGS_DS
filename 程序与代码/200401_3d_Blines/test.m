clc;
% ԭʼ�ڵ�����
x = [-1;-1;1;1;0.2];
y = [1;-0.5;-1;1;0.8];
z = zeros(6,1);
z(3) = 1;
CPnum = size(x,1);

%x,y,z����ֱ����B�������߿��Ƶ�
px = LU_B1(CPnum, x);
py = LU_B1(CPnum, y);
pz = LU_B1(CPnum, z);


%��β���������߱պϡ���ʾԭʼ�ڵ����ݡ�
x(CPnum+1) = x(1);
y(CPnum+1) = y(1);
z(CPnum+1) = z(1);
figure;
plot3(x,y,z,'ro-');
hold on;

for i=1:CPnum %�����ѭ��
    c=num2str(i);
    c=[' ',c];
    text(x(i),y(i),z(i),c)
    %text(x(i),y(i),c)
end

plot3(px,py,pz,'g-');
for i=1:CPnum+1%�����ѭ��
    c=num2str(i);
    c=[' ',c];
    text(px(i),py(i),pz(i),c)
    plot3(px(i),py(i),pz(i),'*');
end
axis equal



px(CPnum+3) = px(3);
py(CPnum+3) = py(3);
pz(CPnum+3) = pz(3);

px(CPnum+4) = px(4);
py(CPnum+4) = py(4);
pz(CPnum+4) = pz(4);


%����֮���10������в�ֵ����
n_pt_in_gaps = 10;
delta = 1.0/n_pt_in_gaps;
for j=1:CPnum
    u = 0.0;
    for i=1:n_pt_in_gaps
        p = px';
        Xi = p(j:j+3);
        xx(i+(j-1)*n_pt_in_gaps) = Cubic_Bsp(u,Xi);
        p = py';
        Yi = p(j:j+3);
        yy(i+(j-1)*n_pt_in_gaps) = Cubic_Bsp(u,Yi);
        
        p = pz';
        Zi = p(j:j+3);
        zz(i+(j-1)*n_pt_in_gaps) = Cubic_Bsp(u,Zi);
        
        u = u + delta;
    end
end


xx(end+1) = x(1);
yy(end+1) = y(1);
zz(end+1) = z(1);
plot3(xx,yy,zz,'b--')

