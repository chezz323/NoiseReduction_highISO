# Noise Reduction of the Image with highISO
Project for Digital Image Processing

## Why
- Noise is inevitable component of image processing
- Taking pictures with camera in low light involve lots of noise
- Many researches studied noise reduction but focus on impulse noise and hard to preserve edges
- Real world noise is not impulse noise
![image](https://user-images.githubusercontent.com/55457315/149301874-a133daea-ce59-494d-98ec-879f113e5df4.png)

## ISO and Noise
- When we taking a picture with Camera, there are three components we should consider, **shutter, aperture, and ISO**.
- ISO determine the sensitivity of Image sensor located in camera
- It directly relate to the noise of the image
- High ISO → More sensitive to the light → Make **noise** on the Image
![image](https://user-images.githubusercontent.com/55457315/149302174-6f736222-8f6e-4ea9-9331-93c80c8c09fe.png)

## Pipe line
![image](https://user-images.githubusercontent.com/55457315/149302340-ff353010-6e8a-43c8-b456-ccff6f6bde0f.png)

## Threshold Selection
- Before detecting noise pixel, measurement of threshold is required.
- Computing difference of pixel from its neighbor for all pixel
![image](https://user-images.githubusercontent.com/55457315/149302457-2ef4cc21-0323-46fd-a626-0a14db28d990.png)
- Arrange difference values to ascending order
- Choose 1/2 and 3/4 values as thresholds

### Algorithm
![image](https://user-images.githubusercontent.com/55457315/149302570-51d93a5e-1eba-4be6-9e7d-363816a3f78e.png)

## Noise Detection
- Find the pixel which have value of difference from its neighbor between two threshold
- This step ensures to avoid replacement normal pixel by kernel
- Compute diff same as step in noise selection
- Outputs binary noise map  
noise pixel → 1  
normal pixel → 0  
![image](https://user-images.githubusercontent.com/55457315/149302791-1d1ed457-281a-40e4-8f6a-23fe61e80818.png)
![image](https://user-images.githubusercontent.com/55457315/149302803-b6e8bca0-9a51-471f-9d2f-e306ab875eb3.png)

## Noise Replacement
![image](https://user-images.githubusercontent.com/55457315/149303300-5df4596e-4af8-4a67-a0d1-380217525fa4.png)

## Performance Evaluation
### Criteria
Mean Square Error  
![image](https://user-images.githubusercontent.com/55457315/149303482-9f2ae807-166d-40c0-80c2-1f05a6e91952.png)

### Evaluation
![image](https://user-images.githubusercontent.com/55457315/149303579-4fa2d63a-c020-4aa1-8a79-93e6637beab8.png)

## Environment
Matlab
