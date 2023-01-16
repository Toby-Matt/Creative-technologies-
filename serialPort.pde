/**
 ENEL599 2022 -  Final Assignment
 Serial Port selection 
 
 Written by Stefan Marks, implemented to program by Toby Matthews 
 Full credit to Stefan marks @ AUT University 
*/


// import GUI elements for the dialogs
import javax.swing.JComboBox;
import javax.swing.JOptionPane;


/**
 * Function to select a serial port either automatically if there is only one
 * or ask the user via a dialog box.
 *
 * @return name of the selected serial port or <code>null</code> if no port was found or selected.
 */
String selectSerialPort()
{
  return selectSerialPort(null);
}

/**
 * Function to select a serial port either automatically if there is only one
 * or ask the user via a dialog box.
 *
 * @param defaultPortName  a port name to try to open by default
 *
 * @return name of the selected serial port or <code>null</code> if no port was found or selected.
 */
String selectSerialPort(String defaultPortName)
{
  String selectedPortName = null;
  
  // detect serial ports
  String[] portNames = Serial.list();
  
  for ( String portName : portNames )
  {
    if (portName.equals(defaultPortName))
    {
      selectedPortName = portName;
      break;
    }
  }
  
  if ( portNames.length == 0 )
  {
    // no ports: inform user
    JOptionPane.showMessageDialog(
      null, 
      "Sorry, I cannot find any serial ports.",
      "No serial ports found",
      JOptionPane.WARNING_MESSAGE);
  }
  else if (selectedPortName == null)
  {
    // no default port selected, we have to make choices now
    if (portNames.length == 1)
    {
       // only one port: no need to ask user
       selectedPortName = portNames[0];
    }
    else
    {
      // more than one port: ask user to select one
      JComboBox cbxPortList = new JComboBox(portNames);
      int option = JOptionPane.showConfirmDialog(
        null, 
        cbxPortList, 
        "Select a Serial Communication Port",
        JOptionPane.OK_CANCEL_OPTION,
        JOptionPane.PLAIN_MESSAGE);
      if (option == JOptionPane.OK_OPTION)
      {
        // user selected a port and pressed OK
        selectedPortName = (String) cbxPortList.getSelectedItem();
      }
    }
  }
  
  return selectedPortName;
}
