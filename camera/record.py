import os
import time
from datetime import datetime

now = datetime.now()
current_time = now.strftime("%Y-%m-%d_%H-%M-%S")
print(current_time)
os.system('echo "filename=' + current_time + 'tt.ts" > ~/picam/hooks/start_record')

# Sleep in seconds.
time.sleep(15)

os.system("touch ~/picam/hooks/stop_record")
