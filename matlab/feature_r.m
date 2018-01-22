Screen('Preference', 'SkipSyncTests', 1); % ����ͬ���Բ���

% �����ںͱ���
sca;
close all;
clearvars;

answer = inputdlg({'���'},'��Ϣ',1,{'0'}); % ��¼���Ա��

% ��������
PsychDefaultSetup(2);
screens = Screen('Screens');
screenNumber = max(screens);
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);
[screenXpixels, screenYpixels] = Screen('WindowSize', window);
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
[xC, yC] = RectCenter(windowRect);

% �վ��󼰰�������
training = nan(240,7);
test = nan(240,8);
zKey = KbName('z');
mKey = KbName('m');
escape = KbName('ESCAPE');

HideCursor; % �������

%--------------------------------------------------------------------------

% ��һ�׶�ָ����
Screen('TextSize', window, 30);
DrawFormattedText(window, double('��ӭ�μӱ�ʵ�飡\n\n�ڱ��׶Σ��㽫�ῴ��������ɫ��ͬ��Բ�Σ�\n\n����������ҵ���ɫ����ɫ��Բ�Σ�ÿ���Դ���ֻ����һ�֣���\n\n�����Բ���ڲ����߶��Ǵ�ֱ�ģ���������ʳָ�������ϵ�Z����\n\n�����Բ���ڲ����߶���ˮƽ�ģ���������ʳָ�������ϵ�M����\n\nÿ����ȷ��Ӧ֮�󣬻�õ�һ���ķ�����\n\n�����۵ķ���������ʵ�������һ��ɽ�Ǯ��\n\n���ڱ�֤��ȷ��ǰ���¾������������Ӧ��\n\n��ʽʵ��ǰ����30���Դε���ϰ����ϰ�׶β���õ���Ǯ��\n\n���׼�����ˣ��밴�����������'), 'center', 'center', white)
Screen('Flip', window);
KbStrokeWait;

% ��һ�׶���ϰ�Դ�
Screen('TextSize', window, 60);
DrawFormattedText(window, double('��ϰ\n\n�����������'), 'center', 'center', white);
Screen('Flip', window);
KbStrokeWait;

color = repmat(['r','g'],1,15);
color = randsample(color,30);

for trial = 1:30;
 
Screen('DrawLines', window, [-8.72 8.72 0 0; 0 0 -8.72 8.72],3, white, [xC yC],2);
Screen('Flip', window);

WaitSecs(Sample([.4,.5,.6]));

Screen('DrawLines', window, [-8.72 8.72 0 0; 0 0 -8.72 8.72],3, white, [xC yC],2);

rect = [xC-43.6,yC-177.4,xC+43.6,yC-87.2;xC-43.6,yC+87.2,xC+43.6,yC+177.4;xC-156.9,yC-112,xC-69.7,yC-21.8;...
       xC+69.7,yC-112,xC+156.9,yC-21.8;xC-156.9,yC+21.8,xC-69.7,yC+112;xC+69.7,yC+21.8,xC+156.9,yC+112];
col = [0,0,1;0,1,1;1,1,0;1,1,1;1,192/255,203/255;1,0.5,0];

id1=randperm(6);
rect1=rect(id1(1),:);

if color(trial) == 'g'
    Screen('FrameOval', window, [0 1 0], rect1',4);
else
    Screen('FrameOval', window, [1 0 0], rect1',4);
end
 
[x,y]=RectCenterd(rect1);
a=rand(1);
    if a >0.5
Screen('DrawLine', window, white, x-30,y,x+30,y,4);
    else
Screen('DrawLine', window, white, x,y-30,x,y+30,4);
    end

rect(id1(1),:)=[];

id2=randperm(5);
rect2=rect(id2(1:5),:);
id3=randperm(6);
col1=col(id3(1:5),:);
Screen('FrameOval', window, col1', rect2',4);

[x1,y1] = RectCenterd(rect2(id2(1),:));
b=rand(1);
    if b>0.5
Screen('DrawLine', window, white, x1-22,y1-22,x1+22,y1+22,5);
    else
Screen('DrawLine', window, white, x1+22,y1-22,x1-22,y1+22,5); 
    end

[x2,y2] = RectCenterd(rect2(id2(2),:));
c=rand(1);
    if c>0.5
Screen('DrawLine', window, white, x2-22,y2-22,x2+22,y2+22,5);
    else
Screen('DrawLine', window, white, x2+22,y2-22,x2-22,y2+22,5); 
    end

[x3,y3] = RectCenterd(rect2(id2(3),:));
d=rand(1);
    if d>0.5
Screen('DrawLine', window, white, x3-22,y3-22,x3+22,y3+22,5);
    else
Screen('DrawLine', window, white, x3+22,y3-22,x3-22,y3+22,5); 
    end
    
[x4,y4] = RectCenterd(rect2(id2(4),:));
e=rand(1);
    if e>0.5
Screen('DrawLine', window, white, x4-22,y4-22,x4+22,y4+22,5);
    else
Screen('DrawLine', window, white, x4+22,y4-22,x4-22,y4+22,5); 
    end
  
[x5,y5] = RectCenterd(rect2(id2(5),:));
f=rand(1);
    if f>0.5
Screen('DrawLine', window, white, x5-22,y5-22,x5+22,y5+22,4);
    else
Screen('DrawLine', window, white, x5+22,y5-22,x5-22,y5+22,4); 
    end

Screen('Flip', window);

tic;

respToBeMade = true;

 while respToBeMade == true; 
     
[KeyIsDown,secs,KeyCode] = KbCheck;

    if KeyCode(escape)
            sca;
    return 
    
    elseif KeyCode(mKey) && a > 0.5  && color(trial) == 'g'  &&  toc < 1.5
         respToBeMade = false;
         Screen('Flip', window);
         WaitSecs(1.0);
         DrawFormattedText(window, double('��ȷ'), 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.5);
    
    elseif KeyCode(mKey) && a > 0.5  && color(trial) == 'r'  &&  toc < 1.5
         respToBeMade = false;
         Screen('Flip', window);
         WaitSecs(1.0);
         DrawFormattedText(window, double('��ȷ'), 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.5);
    
    elseif  KeyCode(zKey)  && a < 0.5  && color(trial) == 'g'  &&  toc < 1.5
         respToBeMade = false;
         Screen('Flip', window);
         WaitSecs(1.0);
         DrawFormattedText(window, double('��ȷ'), 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.5);
    
    elseif  KeyCode(zKey)  && a < 0.5  && color(trial) == 'r'  &&  toc < 1.5
         respToBeMade = false;
         Screen('Flip', window);
         WaitSecs(1.0);
         DrawFormattedText(window, double('��ȷ'), 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.5);
    
    elseif  KeyCode(mKey) && a < 0.5  || KeyCode(zKey)  && a > 0.5  &&  toc < 1.5
        respToBeMade = false;
        Screen('Flip', window);
        WaitSecs(1.0);
        DrawFormattedText(window, double('����'), 'center', 'center', white);
        Screen('Flip', window);
    WaitSecs(1.5);
       
      elseif toc >= 1.5
        respToBeMade = false;
        Screen('Flip', window);
        WaitSecs(1.0);
        DrawFormattedText(window,double('��ʱ'), 'center', 'center', white);
        Screen('Flip', window);
    WaitSecs(1.5);
    
    end  
    
 end

    Screen('Flip', window);
    WaitSecs(1.0);  
 
end

DrawFormattedText(window, double('��ϰ����\n\n�����������'), 'center', 'center', white);
Screen('Flip', window);
KbStrokeWait;

% ��һ�׶���ʽ�Դ�
DrawFormattedText(window, double('��һ�׶�\n\n�����������'), 'center', 'center', white);
Screen('Flip', window);
KbStrokeWait;

A = repmat(['r','g'],1,30);
color1 = randsample(A,60);
color2 = randsample(A,60);
color3 = randsample(A,60);
color4 = randsample(A,60);
color = [color1,color2,color3,color4];

B = repmat(1:6,1,10);
position1 = randsample(B,60);
position2 = randsample(B,60);
position3 = randsample(B,60);
position4 = randsample(B,60);
position = [position1,position2,position3,position4];

points = repmat([10,10,10,10,2],1,12);
point1 = randsample(points,60);
while 1
    if sum(point1((color1=='g'))) == sum(point1((color1=='r')))
        break
    end
    point1 = randsample(points,60);
end  
point2 = randsample(points,60);
while 1
    if sum(point2((color2=='g'))) == sum(point2((color2=='r')))
        break
    end
    point2 = randsample(points,60);
end  
point3 = randsample(points,60);
while 1
    if sum(point3((color3=='g'))) == sum(point3((color3=='r')))
        break
    end
    point3 = randsample(points,60);
end  
point4 = randsample(points,60);
while 1
    if sum(point4((color4=='g'))) == sum(point4((color4=='r')))
        break
    end
    point4 = randsample(points,60);
end  
points = [point1,point2,point3,point4];

for trial = 1:240;
    
    if  trial ==1
        total = 0;
    end
    
    if  points(trial) == 10
        points_l = 2;
    elseif  points(trial) == 2
            points_l =10;
    end  

Screen('DrawLines', window, [-8.72 8.72 0 0; 0 0 -8.72 8.72],3, white, [xC yC],2);
Screen('Flip', window);

WaitSecs(Sample([.4,.5,.6]));

Screen('DrawLines', window, [-8.72 8.72 0 0; 0 0 -8.72 8.72],3, white, [xC yC],2);

rect = [xC-43.6,yC-177.4,xC+43.6,yC-87.2;xC-43.6,yC+87.2,xC+43.6,yC+177.4;xC-156.9,yC-112,xC-69.7,yC-21.8;...
       xC+69.7,yC-112,xC+156.9,yC-21.8;xC-156.9,yC+21.8,xC-69.7,yC+112;xC+69.7,yC+21.8,xC+156.9,yC+112];
col = [0,0,1;0,1,1;1,1,0;1,1,1;1,192/255,203/255;1,0.5,0];

id1=position(trial);
rect1=rect(id1(1),:);

if  color(trial) == 'g'
    Screen('FrameOval', window, [0 1 0], rect1',4);
else
    Screen('FrameOval', window, [1 0 0], rect1',4);
end
 
[x,y]=RectCenterd(rect1);
a=rand(1);
    if a >0.5
Screen('DrawLine', window, white, x-30,y,x+30,y,4);
    else
Screen('DrawLine', window, white, x,y-30,x,y+30,4);
    end

rect(id1(1),:)=[];

id2=randperm(5);
rect2=rect(id2(1:5),:);
id3=randperm(6);
col1=col(id3(1:5),:);
Screen('FrameOval', window, col1', rect2',4);

[x1,y1] = RectCenterd(rect2(id2(1),:));
b=rand(1);
    if b>0.5
Screen('DrawLine', window, white, x1-22,y1-22,x1+22,y1+22,5);
    else
Screen('DrawLine', window, white, x1+22,y1-22,x1-22,y1+22,5); 
    end

[x2,y2] = RectCenterd(rect2(id2(2),:));
c=rand(1);
    if c>0.5
Screen('DrawLine', window, white, x2-22,y2-22,x2+22,y2+22,5);
    else
Screen('DrawLine', window, white, x2+22,y2-22,x2-22,y2+22,5); 
    end

[x3,y3] = RectCenterd(rect2(id2(3),:));
d=rand(1);
    if d>0.5
Screen('DrawLine', window, white, x3-22,y3-22,x3+22,y3+22,5);
    else
Screen('DrawLine', window, white, x3+22,y3-22,x3-22,y3+22,5); 
    end
    
[x4,y4] = RectCenterd(rect2(id2(4),:));
e=rand(1);
    if e>0.5
Screen('DrawLine', window, white, x4-22,y4-22,x4+22,y4+22,5);
    else
Screen('DrawLine', window, white, x4+22,y4-22,x4-22,y4+22,5); 
    end
  
[x5,y5] = RectCenterd(rect2(id2(5),:));
f=rand(1);
    if f>0.5
Screen('DrawLine', window, white, x5-22,y5-22,x5+22,y5+22,4);
    else
Screen('DrawLine', window, white, x5+22,y5-22,x5-22,y5+22,4); 
    end

Screen('Flip', window);

tStart = GetSecs;
tic;

respToBeMade = true;

 while respToBeMade == true
     
[KeyIsDown,secs,KeyCode] = KbCheck;

    if KeyCode(escape)
            sca;
    return 
    
    elseif KeyCode(mKey) && a > 0.5  && color(trial) == 'r'  &&  toc < 1.5
         response = 1;
         respToBeMade = false;
         Screen('Flip', window);
         WaitSecs(1.0);
         total = total + points(trial);
         DrawFormattedText(window, [double('+') double([' ' num2str(points(trial)) ' ']) double(' \n\n ') double('�ܷ�')  double([' ' num2str(total) ' '])], 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.5);
    
    elseif KeyCode(mKey) && a > 0.5  && color(trial) == 'g'  &&  toc < 1.5
         response = 1;
         respToBeMade = false;
         Screen('Flip', window);
         WaitSecs(1.0);
         total = total + points_l;
         DrawFormattedText(window, [double('+') double([' ' num2str(points_l) ' ']) double(' \n\n ') double('�ܷ�')  double([' ' num2str(total) ' '])], 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.5);
    
    elseif  KeyCode(zKey)  && a < 0.5  && color(trial) == 'r'  &&  toc < 1.5
         response = 1;
         respToBeMade = false;
         Screen('Flip', window);
         WaitSecs(1.0);
         total = total + points(trial);
         DrawFormattedText(window, [double('+') double([' ' num2str(points(trial)) ' ']) double(' \n\n ') double('�ܷ�')  double([' ' num2str(total) ' '])], 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.5);
    
    elseif  KeyCode(zKey)  && a < 0.5  && color(trial) == 'g'  &&  toc < 1.5
         response = 1;
         respToBeMade = false;
         Screen('Flip', window);
         WaitSecs(1.0);
         total = total + points_l;
         DrawFormattedText(window, [double('+') double([' ' num2str(points_l) ' ']) double(' \n\n ') double('�ܷ�')  double([' ' num2str(total) ' '])], 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.5);
    
    elseif  KeyCode(mKey) && a < 0.5  || KeyCode(zKey)  && a > 0.5  &&  toc < 1.5
        response = 0;
        respToBeMade = false;
        Screen('Flip', window);
        WaitSecs(1.0);
        DrawFormattedText(window, [double('����') double(' \n\n ') double('�ܷ�')  double([' ' num2str(total) ' '])], 'center', 'center', white);
        Screen('Flip', window);
    WaitSecs(1.5);
       
    elseif  toc>1.5
        response = 0;
        respToBeMade = false;
        Screen('Flip', window);
        WaitSecs(1.0);
        DrawFormattedText(window, [double('��ʱ') double(' \n\n ') double('�ܷ�')  double([' ' num2str(total) ' '])], 'center', 'center', white);
        Screen('Flip', window);
    WaitSecs(1.5);
    
    end
 
 end

tEnd = GetSecs;
rt = tEnd - tStart-2.5; 
 
    training(trial,1) = trial;
    training(trial,2) = color(trial);
    training(trial,3) = rt;
    training(trial,4) = response;
    training(trial,5) = x;
    training(trial,6) = y;
    training(trial,7) = total;
    
    Screen('Flip', window);
    WaitSecs(1.0);  
    
if  trial == 60  ||  trial == 120  ||  trial == 180
    DrawFormattedText(window, double('��Ϣһ��\n\n�����������'), 'center', 'center', white);
    Screen('Flip', window);
    KbStrokeWait;

end

end

DrawFormattedText(window, double('��һ�׶ν���\n\n��������Ϣ\n\n�������������һ�׶�'), 'center', 'center', white);
Screen('Flip', window);
KbStrokeWait;

%--------------------------------------------------------------------------

% �ڶ��׶�ָ����
Screen('TextSize', window, 30);
DrawFormattedText(window, double('�ڱ��׶Σ��㽫�ῴ��������ɫ��ͬ����״��\n\n�������Բ�κ�һ�����Ρ�\n\n����������ҵ����Σ�\n\n����������ڲ����߶��Ǵ�ֱ�ģ���������ʳָ�������ϵ�Z����\n\n����������ڲ����߶���ˮƽ�ģ���������ʳָ�������ϵ�M����\n\n���׶β���õ���Ǯ�������������ע��ɫ��\n\n���ڱ�֤��ȷ��ǰ���¾������������Ӧ��\n\n��ʽʵ��ǰ����18���Դε���ϰ��\n\n���׼�����ˣ��밴�����������'), 'center', 'center', white);
Screen('Flip', window);
KbStrokeWait;

% �ڶ��׶���ϰ�Դ�
Screen('TextSize', window, 60);
DrawFormattedText(window, double('��ϰ\n\n�����������'), 'center', 'center', white);
Screen('Flip', window);
KbStrokeWait;

position = repmat(1:6,1,3);
position = randsample(position,18);

for trial = 1:18;
    
Screen('DrawLines', window, [-8.72 8.72 0 0; 0 0 -8.72 8.72],3, white, [xC yC],2);
Screen('Flip', window);

WaitSecs(Sample([.4,.5,.6]));

Screen('DrawLines', window, [-8.72 8.72 0 0; 0 0 -8.72 8.72],3, white, [xC yC],2);

rect = [xC-43.6,yC-177.4,xC+43.6,yC-87.2;xC-43.6,yC+87.2,xC+43.6,yC+177.4;xC-156.9,yC-112,xC-69.7,yC-21.8;...
       xC+69.7,yC-112,xC+156.9,yC-21.8;xC-156.9,yC+21.8,xC-69.7,yC+112;xC+69.7,yC+21.8,xC+156.9,yC+112];
col = [0,0,1;0,1,1;1,1,0;1,1,1;1,192/255,203/255;1,0.5,0];

id1=position(trial);
rect1=rect(id1(1),:);

id3=randperm(6);
col1=col(id3(1),:);       
        
[x,y]=RectCenterd(rect1);

point = [x,y+43.6;x-43.6,y;x,y-43.6;x+43.6,y];
Screen('FramePoly', window, col1,point,4);

a=rand(1);
    if a >0.5
Screen('DrawLine', window, white, x-30,y,x+30,y,4);
    else
Screen('DrawLine', window, white, x,y-30,x,y+30,4);
    end

rect(id1(1),:)=[];
col(id3(1),:)=[];

id2=randperm(5);
id4=randperm(5);
rect2=rect(id2(1),:);
col2=col(id4(1),:);

Screen('FrameOval', window, col2', rect2',4);

[x1,y1] = RectCenterd(rect2);
b=rand(1);
    if b>0.5
Screen('DrawLine', window, white, x1-22,y1-22,x1+22,y1+22,5);
    else
Screen('DrawLine', window, white, x1+22,y1-22,x1-22,y1+22,5); 
    end

rect(id2(1),:)=[];
col(id4(1),:)=[]; 
    
id5=randperm(4);
id6=randperm(4);
rect3=rect(id5(1:4),:);
col3=col(id6(1:4),:);

Screen('FrameOval', window, col3', rect3',4);
    
[x2,y2] = RectCenterd(rect3(id5(1),:));
c=rand(1);
    if c>0.5
Screen('DrawLine', window, white, x2-22,y2-22,x2+22,y2+22,5);
    else
Screen('DrawLine', window, white, x2+22,y2-22,x2-22,y2+22,5); 
    end

[x3,y3] = RectCenterd(rect3(id5(2),:));
d=rand(1);
    if d>0.5
Screen('DrawLine', window, white, x3-22,y3-22,x3+22,y3+22,5);
    else
Screen('DrawLine', window, white, x3+22,y3-22,x3-22,y3+22,5); 
    end
    
[x4,y4] = RectCenterd(rect3(id5(3),:));
e=rand(1);
    if e>0.5
Screen('DrawLine', window, white, x4-22,y4-22,x4+22,y4+22,5);
    else
Screen('DrawLine', window, white, x4+22,y4-22,x4-22,y4+22,5); 
    end
  
[x5,y5] = RectCenterd(rect3(id5(4),:));
f=rand(1);
    if f>0.5
Screen('DrawLine', window, white, x5-22,y5-22,x5+22,y5+22,5);
    else
Screen('DrawLine', window, white, x5+22,y5-22,x5-22,y5+22,5); 
    end

Screen('Flip', window);

tic;

respToBeMade = true;

 while respToBeMade == true
     
[KeyIsDown,secs,KeyCode] = KbCheck;

    if KeyCode(escape)
       sca;
    return
    
    elseif KeyCode(mKey) && a > 0.5  ||  KeyCode(zKey)  && a < 0.5 
         respToBeMade = false;
         DrawFormattedText(window, double('��ȷ'), 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.0);
    
    elseif KeyCode(zKey) && a > 0.5  ||  KeyCode(mKey)  && a < 0.5
         respToBeMade = false;
         DrawFormattedText(window, double('����'), 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.0);
    
    elseif toc > 1.5
         respToBeMade = false;
         DrawFormattedText(window, double('��ʱ'), 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.0);
    
    end  
    
 end

    Screen('Flip', window);
    WaitSecs(0.5);  
 
end
    
DrawFormattedText(window, double('��ϰ����\n\n�����������'), 'center', 'center', white);
Screen('Flip', window);
KbStrokeWait;

% �ڶ��׶���ʽ�Դ�
DrawFormattedText(window, double('�ڶ��׶�\n\n�����������'), 'center', 'center', white);
Screen('Flip', window);
KbStrokeWait;

D = repmat(['r','g','o','o'],1,15);
color_test1 = randsample(D,60);
color_test2 = randsample(D,60);
color_test3 = randsample(D,60);
color_test4 = randsample(D,60);
color_test = [color_test1,color_test2,color_test3,color_test4];

E = repmat(1:6,1,10);
p_o1 = randsample(E,60);
p_d1 = randsample(E,60);
while 1
    if p_o1(1:60)~=p_d1(1:60)
        break
    end
    p_d1 = randsample(E,60);
end   
p_o2 = randsample(E,60);
p_d2 = randsample(E,60);
while 1
    if p_o2(1:60)~=p_d2(1:60)
        break
    end
    p_d2 = randsample(E,60);
end  
p_o3 = randsample(E,60);
p_d3 = randsample(E,60);
while 1
    if p_o3(1:60)~=p_d3(1:60)
        break
    end
    p_d3 = randsample(E,60);
end  
p_o4 = randsample(E,60);
p_d4 = randsample(E,60);
while 1
    if p_o4(1:60)~=p_d4(1:60)
        break
    end
    p_d4 = randsample(E,60);
end  
position_o = [p_o1,p_o2,p_o3,p_o4];
position_d = [p_d1,p_d2,p_d3,p_d4];

for trial = 1:240;
    
Screen('DrawLines', window, [-8.72 8.72 0 0; 0 0 -8.72 8.72],3, white, [xC yC],2);
Screen('Flip', window);

WaitSecs(Sample([.4,.5,.6]));

Screen('DrawLines', window, [-8.72 8.72 0 0; 0 0 -8.72 8.72],3, white, [xC yC],2);

rect = [xC-43.6,yC-177.4,xC+43.6,yC-87.2;xC-43.6,yC+87.2,xC+43.6,yC+177.4;xC-156.9,yC-112,xC-69.7,yC-21.8;...
       xC+69.7,yC-112,xC+156.9,yC-21.8;xC-156.9,yC+21.8,xC-69.7,yC+112;xC+69.7,yC+21.8,xC+156.9,yC+112];
col = [0,0,1;0,1,1;1,1,0;1,1,1;1,192/255,203/255;1,0.5,0];

id1=position_o(trial);
rect1=rect(id1(1),:);
id2=position_d(trial);
rect2=rect(id2(1),:);

id3=randperm(6);
col1=col(id3(1),:);
        
[x,y]=RectCenterd(rect1);

point = [x,y+43.6;x-43.6,y;x,y-43.6;x+43.6,y];
Screen('FramePoly', window, col1,point,4);

a=rand(1);
    if a >0.5
Screen('DrawLine', window, white, x-30,y,x+30,y,4);
    else
Screen('DrawLine', window, white, x,y-30,x,y+30,4);
    end

rect([id1(1),id2(1)],:)=[];
col(id3(1),:)=[];

id4=randperm(5);
col2=col(id4(1),:);

    if color_test(trial) == 'g'
Screen('FrameOval', window, [0 1 0], rect2',4);
    elseif color_test(trial) == 'r'
Screen('FrameOval', window, [1 0 0], rect2',4);  
    else
Screen('FrameOval', window, col2', rect2',4);
    end

[x1,y1] = RectCenterd(rect2);
b=rand(1);
    if b>0.5
Screen('DrawLine', window, white, x1-22,y1-22,x1+22,y1+22,5);
    else
Screen('DrawLine', window, white, x1+22,y1-22,x1-22,y1+22,5); 
    end

col(id4(1),:)=[]; 
    
id5=randperm(4);
id6=randperm(4);
rect3=rect(id5(1:4),:);
col3=col(id6(1:4),:);

Screen('FrameOval', window, col3', rect3',4);
    
[x2,y2] = RectCenterd(rect3(id5(1),:));
c=rand(1);
    if c>0.5
Screen('DrawLine', window, white, x2-22,y2-22,x2+22,y2+22,5);
    else
Screen('DrawLine', window, white, x2+22,y2-22,x2-22,y2+22,5); 
    end

[x3,y3] = RectCenterd(rect3(id5(2),:));
d=rand(1);
    if d>0.5
Screen('DrawLine', window, white, x3-22,y3-22,x3+22,y3+22,5);
    else
Screen('DrawLine', window, white, x3+22,y3-22,x3-22,y3+22,5); 
    end
    
[x4,y4] = RectCenterd(rect3(id5(3),:));
e=rand(1);
    if e>0.5
Screen('DrawLine', window, white, x4-22,y4-22,x4+22,y4+22,5);
    else
Screen('DrawLine', window, white, x4+22,y4-22,x4-22,y4+22,5); 
    end
  
[x5,y5] = RectCenterd(rect3(id5(4),:));
f=rand(1);
    if f>0.5
Screen('DrawLine', window, white, x5-22,y5-22,x5+22,y5+22,5);
    else
Screen('DrawLine', window, white, x5+22,y5-22,x5-22,y5+22,5); 
    end

Screen('Flip', window);

tStart = GetSecs;
tic;

respToBeMade = true;

 while respToBeMade == true
     
[KeyIsDown,secs,KeyCode] = KbCheck;

    if KeyCode(escape)
            sca;
    return 
    
    elseif KeyCode(mKey) && a > 0.5  &&  color_test(trial) == 'g'  ||  KeyCode(zKey)  && a < 0.5  && color_test(trial) == 'g'
         response = 1;
         respToBeMade = false;
         DrawFormattedText(window, double('��ȷ'), 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.0);
    
    elseif KeyCode(mKey) && a > 0.5  &&  color_test(trial) == 'r'  ||  KeyCode(zKey)  && a < 0.5  && color_test(trial) == 'r'
         response = 1;
         respToBeMade = false;
         DrawFormattedText(window, double('��ȷ'), 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.0);
        
    elseif  KeyCode(mKey) && a > 0.5  && color_test(trial) == 'o'  ||  KeyCode(zKey)  && a < 0.5  && color_test(trial) == 'o'
         response = 1;
         respToBeMade = false;
         DrawFormattedText(window, double('��ȷ'), 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.0);     
    
    elseif KeyCode(zKey) && a > 0.5  ||  KeyCode(mKey)  && a < 0.5
         response = 0;
         respToBeMade = false;
         DrawFormattedText(window, double('����'), 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.0);    
    
    elseif toc > 1.5
         response = 0;
         respToBeMade = false;
         DrawFormattedText(window, double('��ʱ'), 'center', 'center', white);
         Screen('Flip', window);
    WaitSecs(1.0);    
    
    end  
    
 end

tEnd = GetSecs;
rt = tEnd - tStart-1.0;

    test(trial,1) = color_test(trial);
    test(trial,2) = 0;
    test(trial,3) = rt;
    test(trial,4) = response;
    test(trial,5) = x;
    test(trial,6) = y;
    test(trial,7) = x1;
    test(trial,8) = y1;
 
    Screen('Flip', window);
    WaitSecs(0.5);  
 
if  trial == 60   ||  trial == 120  ||  trial == 180
    DrawFormattedText(window, double('��Ϣһ��\n\n�����������'), 'center', 'center', white);
    
    Screen('Flip', window);
    KbStrokeWait;
end 

end

DrawFormattedText(window, double('ȫ��ʵ�����\n\nлл��'), 'center', 'center', white);
Screen('Flip', window);
KbStrokeWait;

% ��¼����
results = [training,test]; 
csvwrite(['sub_featuret_r' char(answer(1)) '.csv'],results,0);

ShowCursor; % ��ʾ���

sca; % �˳�