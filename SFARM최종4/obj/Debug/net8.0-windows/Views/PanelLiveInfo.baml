   M S B A M L   `   `   `  ����@  <SFARM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:SFARM.ViewsSFARM.Views  5          SFARM.Views.PanelLiveInfo   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      X TFontAwesome.Sharp, Version=6.3.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10fFfa=http://schemas.awesome.incremented/wpf/xaml/fontawesome.sharp  5      %localclr-namespace:SFARM.Views  5        � 	Resources  5
       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $ /Styles/ButtonStyles.xaml?�6%   �� 5      $ /Styles/UIcolor.xaml?�6%   �� 5      $ /Styles/WigetsStyles.xaml?�6%   %    5      .��5      �  
  color5#��[  6    � RowDefinitions 5   
   �� 5      $
��1.2* �6   �� 5      $��20 �6   �� 5      $��1* �6   �� 5      $
��20px �6   �� 5      $��1* �6   �� 5      $
��20px �6   �� 5      $��1* �6   �� 5      $
��20px �6   �� 5      $��1* �6   �� 5       $
��20px �6   .+�5#   
   �� $��0��6    �� Orientation$ 
Horizontal=�6"   $��Center=�6;   $��Center=�6V   $��-25,0,0,-25q�6s   .+�5$      �� $��실시간 정보��6   $��Nanumgothic)�6%   $��35(�6>   $��DemiBold"�6L   !  FontAwesome.Sharp.IconImage  5%      �  �FontAwesome.Sharp.IconImageBase`1[[FontAwesome.Sharp.IconChar, FontAwesome.Sharp, Version=6.3.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10f]]   Icon$ SunPlantWilt=�6     PanelLiveInfoicon#��[ 6/    
 color4   
Foreground# [ 6Z   5&      �� 5(   
   $��2��6   $��Center=�6"   $ 
Horizontal=�6=   .+�5)      � $
��20,0q�6   .+�5*      A�   PanelLiveInfoEllipse#��[ 6     5+      $ Temperature3=�6   #��[ 63   
 �  ��6^   5,      � 5-      $��Right=�6   .+�5.      �� $
��Left=�6   $	��140��68   .+�5/      �� $��현재 온도��6     PaneLiveInfoTitle#��[ 6,   �� 50      -   5         ��Name$ lblTemperature��50      $��26도��64     PaneLiveInfoSensor#��[ 6B   51      52      53      �� 54   
   $��4��6   $��Center=�6"   $ 
Horizontal=�6=   .+�55      � $
��20,0q�6   .+�56      A� #��[ 6     57      $ GlassWaterDroplet=�6   #��[ 68   
 �**��6c   58      � 59      $��Right=�6   .+�5:      �� $
��Left=�6   $	��140��68   .+�5;      �� $��토양 수분도��6   #��[ 6-   �� 5<      -   5        $ lblSoilMoisture��5<      $	��60%��65   #��[ 6C   5=      5>      5?      �� 5@   
   $��6��6   $��Center=�6"   $ 
Horizontal=�6=   .+�5A      � $
��20,0q�6   .+�5B      A� #��[ 6     5C      $	 Sun=�6   #��[ 6*   
 � ���6U   5D      � 5E      $��Right=�6   .+�5F      �� $
��Left=�6   $	��140��68   .+�5G      �� $��조도��6   #��[ 6)   �� 5H      -   5        $ lblLight��5H      $��3000lux��6.   #��[ 6@   $��30(�6l   5I      5J      5K      �� 5L   
   $��8��6   $��Center=�6"   $ 
Horizontal=�6=   .+�5M      � $
��20,0q�6   .+�5N      A� #��[ 6     5O      $ HouseFloodWater=�6   #��[ 66   
 ��ح�6a   5P      � 5Q      $��Right=�6   .+�5R      �� $
��Left=�6   $	��140��68   .+�5S      �� $��물탱크 상황��6   #��[ 6-   �� 5T      -   5        $ lblWater��5T      $��여유��6.   #��[ 6;   5U      5V      5W      �� 5[   
   $��1��6     ControlWigetStroke#��[ 6   �� 5\   
   $��3��6   #��[ 6   �� 5]   
   $��5��6   #��[ 6   �� 5^   
   $��7��6   #��[ 6   5`      5a      