# LET-ME-BREATH

Let me breath is an open source project to develop a low cost body camera.  
Main goal of the project is to transfer to a remote server as soon as possible.
The Project uses `RasberryPi Zero W` to use as a module
to capture via the camera and upload to a specific remote file storage or a server.

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
    * Download wifi configuration file. https://github.com/Tubbie/let-me-breath/blob/master/setup/wpa_supplicant.conf
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

That's all you are all set. Now lets head over to usage.

## Usage

Currently, this project only supports Dropbox as remote storage. If you wish to have more options please feel free to create an issue or better make a pull request. :-)




## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/gpl-3.0/)
