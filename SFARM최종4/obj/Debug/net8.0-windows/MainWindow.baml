   M S B A M L   `   `   `  ����@  <SFARM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:SFARMSFARM  5   	       SFARM.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   X TFontAwesome.Sharp, Version=6.3.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10fFfa=http://schemas.awesome.incremented/wpf/xaml/fontawesome.sharp  5   	   localclr-namespace:SFARM  5   	   -   5          � WindowStyle$  ThreeDBorderWindow=�5	   	    � Title$ 
MainWindow��5
   	   $	��700��6   $
��1200��6)    � 	Resources 5       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $ /Styles/ButtonStyles.xaml?�6%   �� 5      $ /Styles/UIcolor.xaml?�6%   %    5      .��5      �� $��1q�6    �� CornerRadius$ 10��6!    
  color1#��[  63   ._�5   
   �  � RowDefinitions 5      �� 5      $
��60px �6    �� 5      $��1* �6     � ColumnDefinitions 5      �� 5      $��200px �6#   �� 5      $��1* �6#   .+�5       � $��0��6   $��0��6    $��2��60   #��[  6D    5!      �� 5"      $��200px �6'   �� 5#      $��1* �6'   �� 5$      $��200px �6'   .+�5&      �� $��0��6   $��S:FARM��6(     	MainLabel#��[ 69   �� 5'      $��1��6   $&�� 방토와 함께한 지 13일째��6(     TopBarMiddleLabel#��[ 6A   �� 5(      $��2��6   $��2024 - 05 - 28��6(     TopBarRightLabel#��[ 6A   5+      � 5/      $��2��6   $��0��6     
 color3#��[ 60    50      �� 51      $
��60px �6$   �� 52      $
��45px �6$   �� 53      $
��35px �6$   �� 54      $
��45px �6$   �� 55      $
��45px �6$   �� 56      $
��35px �6$   �� 57      $
��45px �6$   �� 58      $
��45px �6$   �� 59      $
��45px �6$   �� 5:      $
��35px �6$   �� 5;      $��1* �6$   �� 5<      $
��45px �6$   .+�5A      �� $��2��6     
menuStroke#��[ 6$   �� 5B      $��5��6   #��[ 6$   �� 5C      $��9��6   #��[ 6$   �� 5G      $��0��6   #��[ 6%   $"��안녕하세요. 익명 님!��6P   $��	0,0,0,-40q�6g   � 5H      $��1��6   .+�5I      ��   combobox_style#��[ 6     ComboBoxItemStyle#��[ 6G   $��30��6   $	��140��6�   $��2��6�   $��	30,8,30,7q�6�    �� SelectedIndex$ 0��6�   .@�5J      �� -   5        $��item1��5J   '   .��64   방울토마토6;   �� 5K      -   5        $��item2��5K   '   .��64   	강낭콩69   �� 5L      -   5        $��item3��5L   '   66   5M      5N      	� 5O      -   5        	 	�Name$	 
BtnMnuHome��5P      $��3��5O        
menuButton#��[ 6,    
	 color5

 � Tag#
 [	 6P   .��5Q      ��  �� Orientation$ 
Horizontal=�6!   .+�5R      !  FontAwesome.Sharp.IconImage  �  �FontAwesome.Sharp.IconImageBase`1[[FontAwesome.Sharp.IconChar, FontAwesome.Sharp, Version=6.3.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10f]]   Icon$
 Home=�6'    
 menuButtonIcon#��[
 63   �� 5S      $
��HOME��6$     menuButtonText#��[ 60   5T      5U      	� 5W      -   5        $	 BtnMunMyPlants��5X      $��4��5W      #��[ 6,   #
 [	 6P   .��5Y      �� $ 
Horizontal=�6!   .+�5Z        $
 Leaf=�6'   #��[
 63   �� 5[      $��	My Plants��6$   #��[ 65   5\      5]      	� 5_      -   5        $	 	BtnMyInfo��5`      $��6��5_      #��[ 6,   #
 [	 6P   .��5a      �� $ 
Horizontal=�6!   .+�5b        $ 
InfoCircle=�6'   #��[
 69   �� 5c      $��My Info��6$   #��[ 63   5d      5e      	� 5f      $��7��6   #��[ 6,   #
 [	 6P   .��5g      �� $ 
Horizontal=�6!   .+�5h        $
 Book=�6'   #��[
 63   �� 5i      $��Previous��6$   #��[ 64   5j      5k      	� 5l      $��8��6   #��[ 6,   #
 [	 6P   .��5m      �� $ 
Horizontal=�6!   .+�5n        $ BookOpen=�6'   #��[
 67   �� 5o      $��Record��6$   #��[ 62   5p      5q      5s      �� 5t      $��1��6   � 5x      $��1��6   $��1��6    .+�5y      �� -   5         ��Name$ 
ActiveItem��5y   !   
�������65   5z      5{      5|      5}      