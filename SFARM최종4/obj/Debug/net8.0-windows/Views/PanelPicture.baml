   M S B A M L   `   `   `  ����@  <SFARM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:SFARM.ViewsSFARM.Views  5          SFARM.Views.PanelPicture   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Syncfusion.SfInput.Wpf, Version=26.1.40.0, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89e aSyncfusion.SfProgressBar.WPF, Version=26.1.40.0, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89i	 eSyncfusion.SfTextInputLayout.WPF, Version=26.1.40.0, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89^
 ZSyncfusion.Shared.WPF, Version=26.1.40.0, Culture=neutral, PublicKeyToken=3d67ed1f87d44c898
Syncfusion!http://schemas.syncfusion.com/wpf   	 
 5      +localclr-namespace:SFARM.Views   	 
 5      .��5      �  
  color5#��[  6     � RowDefinitions  5   
   �� 5      $��4* �6   �� 5      $
��0.4* �6   �� 5      $��2* �6   .+�5   
   � $��0��6   $��-30,-30,-30,-100q�6   .+�5      A�   CircularPBarInnerEllipse#��[ 6   ��5      �� 5       �� ImageSource$" \Images\방울토마토4.png��6!   5      :  4Syncfusion.UI.Xaml.ProgressBar.SfCircularProgressBar  5      -   5          Name$ CircularProgressBar��5   a     CircularProgressBarStyle#��[ 6/   4  .Syncfusion.UI.Xaml.ProgressBar.ProgressBarBase   Progress$ 73Q�5   /      ProgressContent 5      �� 5      .+�5      ��  �� TextAlignment$ Center=�5   $    
 color1#��[ 6;   $��
0,-190,0,0q�6`   $��50(�6t   ��5   $   �� *
Progress+ �� ElementName$ CircularProgressBar�� �� StringFormat$
 {0}%��5   t   5      5      5!      �� 5#   
   $��1��6   $��Center=�6   $��Center=�6:   $��방울토마토��5&      5'      � 5)   
   $��2��6   $��30,10q�6     5*      �� 5+      $��1* �6    �� 5,      $��1* �6     � ColumnDefinitions 5.      �� 5/      $��1* �6#   �� 50      $��1* �6#   �� 51      $��1* �6#   .+�54      A� $��0��6   $��0��6#     CircularPictureEllipse#��[ 63   ��55      �� 56      $ \Images\pic1.png��6!   58      A� 59      $��0��6   $��1��6#   $��60��63   $��60��6>   
�������6J   A� 5:      $��0��6   $��2��6#   $��60��63   $��60��6>   
�������6J   A� 5;      $��1��6   $��0��6#   $��60��63   $��60��6>   
�������6J   A� 5<      $��1��6   $��1��6#   $��60��63   $��60��6>   
�������6J   A� 5=      $��1��6   $��2��6#   $��60��63   $��60��6>   
�������6J   5>      5A      5B      