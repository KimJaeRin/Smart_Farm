   M S B A M L   `   `   `  ����@  <SFARM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:SFARM.ViewsSFARM.Views  5          SFARM.Views.PanelControl   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      +localclr-namespace:SFARM.Views     5      _ [Syncfusion.SfInput.Wpf, Version=26.1.40.0, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89e aSyncfusion.SfProgressBar.WPF, Version=26.1.40.0, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89i	 eSyncfusion.SfTextInputLayout.WPF, Version=26.1.40.0, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89^
 ZSyncfusion.Shared.WPF, Version=26.1.40.0, Culture=neutral, PublicKeyToken=3d67ed1f87d44c898
syncfusion!http://schemas.syncfusion.com/wpf   	 
 5        � 	Resources  5
       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $ /Styles/ButtonStyles.xaml?�6%   �� 5      $ /Styles/UIcolor.xaml?�6%   �� 5      $ /Styles/WigetsStyles.xaml?�6%   %    5      .��5      �  
  color5#��[  6    � RowDefinitions 5   
   �� 5      $��1* �6   �� 5      $��1* �6   �� 5      $
��20px �6   �� 5      $��1* �6   �� 5      $��1* �6   �� 5      $
��20px �6   �� 5      $��1* �6   �� 5      $
��1.5* �6   .+�5*   
   �� $��0��6   $��20,10,20,10q�6"   .+�5+      ��  �� Orientation$ 
Horizontal=�6   .+�5,      ��   PanelcontrolLabel#��[ 6   $��	급수량��6D   �� 5-      -   5         ��Name$# textBox_CumstomSliderWithTick��5-      $��10,0,0,0q�6A   $��23��6S   $��30��6_   $��Center=�6�    
 color2#��[ 6�    
 color1#��[ 6�   ��6j   �� *Value+ �� ElementName$ CustomSlider�� �� Mode$ TwoWay=�.��6O    5.       �� 
TargetType	 �� Property
 �� Value��%^   '��       �� 5/      " ��6    .�50      �� 	 �@��CornerRadius$
 4��6=   51      52      .��6)   53      54      � 55      $��Center=�6    � Orientation$ 
Horizontal=�65   $	��230��6N   .+�56      �� -   5         ��Name$ CustomSlider��56       �� IsSnapToTickEnabled$
 True��6/   $	��230��6�    � Maximum$	 250Q�6�    �� TickPlacement$ BottomRight=�6�    �� TickFrequency$ 20Q�6�     CustomSliderStyle#��[ 6�    
 color3#��[ 6   � Value 6J   �� $# textBox_CumstomSliderWithTick�� �� Path$
 Text�$ TwoWay=�6  57      58      �� 59   
   $��1��6   $��Center=�6"   $��Center=�6?   $ 
Horizontal=�6Z   .+�5:      � $��60��6   $	��230��6   .+�5;      : 	 4Syncfusion.UI.Xaml.TextInputLayout.SfTextInputLayout  $��0��6/   $��RightToLeft=�6?      Hint$ 토양 수분도��6[    
 color6   FocusedForeground# [ 6i   #��[ 6�      ContainerType$ Outlined=�6�      	InputView. 5<      �� -   5        $
 soil��5<      $��50��6,   66   5=      5>      5?      �� 5A   
   $��3��6   $��20,10,20,10q�6"   .+�5B      �� $ 
Horizontal=�6   $��Center=�62   .+�5C      �� #��[ 6   $��쿨링팬 작동 온도��6D   �� 5D      -   5        $ textBox_TempTick��5D      $��Center=�6q   #��[ 6�   $
��Bold"�6�   $��20(�6�   
������ 
������ $��25��6  ��64   �� *Value+$ 
TempSlider��$ TwoWay=�6  �� 5E      $	��°C��6   $��Center=�6%   #��[ 6I   $��20(�6n   
������ 
������ $��DemiBold"�6�   $��34��6�   5F      � 5G      $��Center=�6   $ 
Horizontal=�65   $	��230��6N   .+�5H      �� -   5        $ 
TempSlider��5H      $
 True��6-   $	��230��6�    � Minimum$ 22Q�6�   $ 38Q�6�   $ BottomRight=�6�   $ 1Q�6�   #��[ 6�   #��[ 6   6H   �� $ textBox_TempTick��$
 Text�$ TwoWay=�63  5I      5J      �� 5L   
   $��4��6   $��Center=�6"   $ 
Horizontal=�6?   .+�5N      �� 
�������$��1q�6(    �� CornerRadius$ 3��6<   $	��230��6M   $��50��6Y   ._�5O      � $��40��6    � ColumnDefinitions 5P      �� 5Q      $��1* �6+   �� 5R      $��1* �6+   �� 5S      $��1* �6+   .+�5U      	� -   5         	� 	GroupName$ fanSpeed��5U   "   $	��강��67     RadioButtonStyle1#���  6b   	� 5V      -   5        $ fanSpeed��5V   "   $��1��67   $	��중��6G    d� 	IsChecked$
 TrueY�6S   #���  6�   	� 5W      -   5        $ fanSpeed��5W   "   $��2��67   $	��약��6G   #���  6r   5X      5Y      5Z      �� 5[   
   $��6��6   $��20,10,20,10q�6"   .+�5\      �� $ 
Horizontal=�6   .+�5]      �� #��[ 6   $��식물등 밝기��6D   5^      � 5_      $��Center=�6   $ 
Horizontal=�65   $	��230��6N   .+�5`      �� -	   5        $ LEDLightSlider��5`      $
 True��61   $	��190��6�   $ 1Q�6�   $ 10Q�6�   $ BottomRight=�6�   $ 1Q�6�   #��[ 6�   #��[ 6   6L   �� $ textBox_LEDLightTick��$
 Text�$ TwoWay=�6  �� 5a      -
   5        $ textBox_LEDLightTick��5a      $��10,0,0,0q�68   $��23��6J   $��30��6V   $��Center=�6�   #��[ 6�   #��[ 6  ��6a   �� *Value+$ LEDLightSlider��$ TwoWay=�.��6?    5b      ��%^   '��       �� 5c      " ��6    .�5d      �� 	 �@��CornerRadius$
 4��6=   5e      5f      .��6)   5g      5h      5i      �� 5m   
   $��2��6     ControlWigetStroke#��[ 6   �� 5n   
   $��5��6   #��[ 6   5o      5p      