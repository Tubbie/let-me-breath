# LET-ME-BREATHE

Let me breathe is an open source project to develop a low cost body camera.  
Main goal of the project is to transfer to a remote server as soon as possible.
The Project uses `RasberryPi Zero W` to use as a module
to capture via the camera and upload to a specific remote file storage or a server.

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/s8nQU0ljaas/0.jpg)](https://youtu.be/s8nQU0ljaas)

## Installation

Requirements for the Installation.

Hardware Requirements.
* [RaspberryPi Single Board Computer.](https://www.raspberrypi.org/) RaspberryPi Zero W preffered.
* [RaspberryPi Camera Module.](https://www.raspberrypi.org/products/camera-module-v2/)
* Power Source. Can be a Power Bank outputting 5V.
* MicroUSB Cable.
* MicroSD Card. 8GB+ Recommended.
* MicroSD card reader. (If needed.)
* Raspberry Pi Case. (Recommended if for outdoor use.)

Software Requirements.
* [Raspberry Pi OS Lite.](https://www.raspberrypi.org/downloads/)
* Image making tool like.
    * [Imager](https://www.raspberrypi.org/downloads/) (Recommended)
    * [Etcher](https://www.balena.io/etcher/)
* A Computer. (Need help with Windows and MAC OS documentation.)


Steps to install.
1. Insert MicroSD card to your PC.
2. Use an Imaging tool to create the RasPi OS Lite(32 Bit if the RAM is less than 1GB) image on the MicroSD card.
3. After completion there should be 2 disk drives shown in your Folder viewer.
    * /boot
    * /rootfs
4. Now First: we need to create an empty file inside `/boot`. Execute the following command.
    ```bash
    touch ssh
   ```
   This will enable the SSH on your RaspberryPi and can come in handy for quick debugging.
5. Second: we need to set the WiFi configuration on the SD card.
    * Download wifi configuration file. https://github.com/Tubbie/let-me-breathe/blob/master/setup/wpa_supplicant.conf
    * Replace
         * `<YourCountryCode>` with your country code.  Ex: For U.S.A `US` and Germany `DE` etc.
         * `<YourWifiNetworkName>` with the WiFi name.
         * `<YourWiFiPassword>` with the WiFi Password.
         * Important : Character `<` and `>` should not be included.
    * Place this file at `/rootf/etc/wpa_supplicant`

6. Remove the MicroSD card and insert it in RaspberryPi. Power it on.
7. Test if your RaspberryPi is connected and reachable.
    * To test first we need to find the IP. Run the bellow in a Terminal.
    ```bash
   ip n | grep "b8:27:eb"
    ```
   This would out put something like
   ```bash
   192.168.0.100 dev wlp2s0 lladdr b8:27:eb:xx:xx:xx STALE
   ```
   Here `192.168.0.100` is the IP address.
   
8. Now we have to enable the camera module on RaspberryPi. It is disabled by default.
    * In terminal run `sudo raspi-config`.
    * Select Interfacing Options.
    * Select P1 Camera and select enable.
    * Select Finish. 
    * RaspberryPi will restart.

That's all you are all set. Now lets head over to usage.

## Usage

Currently, this project only supports Dropbox as remote storage. If you wish to have more options please feel free to create an issue or better make a pull request. :-)

Setting Up DropBox.  
You would need to enable dropbox api and generate an access token.
1. Login to your [Dropbox APP Console](https://www.dropbox.com/developers/apps)
2. Click on create app.
3. Select Dropbox API for `Choose an API`
4. Select App Folder for `Choose the type of access you need`
5. Give a name to your folder. This is a unique name dropbox wide, hence the desired name might not be available.
6. Click create app. You will be taken to the app console page.
7. In the section `OAuth 2` Click on `Generate`.
8. Copy the generated string and save it in a file. Important: Do not share this key with anyone.
 
Setting up RaspberryPi:
1. Use an SSH client to login to RaspberryPi. (Default Username:`pi` , Password: `raspberry`)
2. In terminal of RaspberryPi execute the following.
    ```bash
   wget https://raw.githubusercontent.com/Tubbie/let-me-breath/master/setup/simple_install.sh -P /home/pi && chmod +x /home/pi/simple_install.sh
   ```
3. Run the following code for it to automatically setup the capture and upload service.
    ```bash
    ./home/pi/simple_install.sh
    ```
4. Follow the instructions.

Next time the RaspberryPi boots up it will start recording and files will be uploaded to dropbox.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Future implementation / Need Help.
* Voice activated recording.
* Recording with audio.
* Recording with bluetooth.
* Support for different Online Drive providers (Ex: GoogleDrive, OneDrive etc.)
* Documentation with Windows and MAC OS.

## Disclaimer
Please check your local laws before recording in public areas. The author or contributors are not responsible for any unethical, illegal use or usage with intent of malice.

## License
[MIT](https://choosealicense.com/licenses/gpl-3.0/)
