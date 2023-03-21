
    function displayCroppedMain(fileid, cover){
      var ImgUrl = window.URL.createObjectURL(document.getElementById(fileid).files[0]);
      var elem = document.getElementById('croppedImg');

      
      // document.getElementById('PropertyDetails').getElementsByClassName('flexibleContainer')[1].style.marginTop = '-51px';
      document.getElementById('PropertyDetails').getElementsByClassName('insideImg ')[0].style.marginTop = '-100px';
      document.getElementById('cover').style.display = '';

      if(elem){
          elem.remove(); 
      }
      var img = new Image()
      img.src = window.URL.createObjectURL(event.target.files[0])
      document.getElementsByClassName('insideImg')[0].style.visibility = 'hidden';
      // const inputImage = new Image();
      // const inputWidth = inputImage.naturalWidth;
      crop(ImgUrl, img.width/img.height).then(canvas => {
        document.getElementById(cover).appendChild(canvas);
        var elemCanv = document.getElementById('croppedImg'); 
        if(img.naturalWidth/img.naturalHeight > 3){
          elemCanv.style.marginLeft = 0;
        }else{
          elemCanv.style.marginLeft = (document.getElementsByClassName('frontImageFlex')[0].offsetWidth/(img.naturalWidth/img.naturalHeight)/2)/2;
        }
        
        // console.log(img.naturalWidth/img.naturalHeight)
        // console.log(img.naturalWidth)
      });
    }

    function cuttheimg(width, height){
      document.getElementsByClassName('canvasLogoMain')[0].style.maxHeight = '20px' 
    }

    function displayCroppedMainCompany(fileid, cover){
      var ImgUrl = window.URL.createObjectURL(document.getElementById(fileid).files[0]);
      var elem = document.getElementById('croppedImg');
      if(elem){
        elem.remove(); 
      }

      var img = new Image()
      img.src = window.URL.createObjectURL(event.target.files[0])


      img.onload = () => {
        // console.log(img.width + ' ' +img.height);
        // console.log((img.width/img.height) <= 1.1);

        if((img.width/img.height) <= 1.1){
          document.getElementById('wideId').classList.remove('frontImageWideLogo');
          document.getElementById('wideId').classList.add('frontImageLogo');
        }else{
          document.getElementById('wideId').classList.add('frontImageWideLogo');
          document.getElementById('wideId').classList.remove('frontImageLogo');
        }

        document.getElementById(fileid).parentElement.getElementsByClassName('insideWideImg')[0].style.visibility = 'hidden';
        console.log(img.width/img.height);
        crop(ImgUrl, img.width/img.height).then(canvas => {
          document.getElementById(cover).appendChild(canvas);
        }).then( function(){var a = document.getElementById('croppedImg'); a.style.maxHeight = 200 * img.height/img.width + 'px'; a.style.position = 'relative';  a.style.top = '30px'; document.getElementById('cover').style.display ='';} )

      }       
      
    }

    /**
 * @param {string} url - The source image
 * @param {number} aspectRatio - The aspect ratio
 * @return {Promise<HTMLCanvasElement>} A Promise that resolves with the resulting image as a canvas element
 */
function crop(url, aspectRatio) {
  // we return a Promise that gets resolved with our canvas element
  return new Promise((resolve) => {
    // this image will hold our source image data
    const inputImage = new Image();

    // we want to wait for our image to load
    inputImage.onload = () => {
      // let's store the width and height of our image
      const inputWidth = inputImage.naturalWidth;
      const inputHeight = inputImage.naturalHeight;

      // get the aspect ratio of the input image
      const inputImageAspectRatio = inputWidth / inputHeight;

      // if it's bigger than our target aspect ratio
      let outputWidth = inputWidth;
      let outputHeight = inputHeight;
      if (inputImageAspectRatio > aspectRatio) {
        outputWidth = inputHeight * aspectRatio;
      } else if (inputImageAspectRatio < aspectRatio) {
        outputHeight = inputWidth / aspectRatio;
      }

      // calculate the position to draw the image at
      const outputX = (outputWidth - inputWidth) * 0.5;
      const outputY = (outputHeight - inputHeight) * 0.5;

      // create a canvas that will present the output image
      const outputImage = document.createElement("canvas");

      // set it to the same size as the image
      outputImage.width = outputWidth;
      outputImage.height = outputHeight;
      outputImage.className = 'canvasLogoMain';
      outputImage.id='croppedImg';

      // draw our image at position 0, 0 on the canvas
      const ctx = outputImage.getContext("2d");
      ctx.drawImage(inputImage, outputX, outputY);
      resolve(outputImage);
    };

    // start loading our image
    inputImage.src = url;

  });
}

function crop2(url, aspectRatio) {
  // we return a Promise that gets resolved with our canvas element
  return new Promise((resolve) => {
    // this image will hold our source image data
    const inputImage = new Image();

    // we want to wait for our image to load
    inputImage.onload = () => {
      // let's store the width and height of our image
      const inputWidth = inputImage.naturalWidth;
      const inputHeight = inputImage.naturalHeight;

      // get the aspect ratio of the input image
      const inputImageAspectRatio = inputWidth / inputHeight;

      // if it's bigger than our target aspect ratio
      let outputWidth = inputWidth;
      let outputHeight = inputHeight;
      if (inputImageAspectRatio > aspectRatio) {
        outputWidth = inputHeight * aspectRatio;
      } else if (inputImageAspectRatio < aspectRatio) {
        outputHeight = inputWidth / aspectRatio;
      }

      // calculate the position to draw the image at
      const outputX = (outputWidth - inputWidth) * 0.5;
      const outputY = (outputHeight - inputHeight) * 0.5;

      // create a canvas that will present the output image
      const outputImage = document.createElement("canvas");

      // set it to the same size as the image
      outputImage.width = outputWidth;
      outputImage.height = outputHeight;
      outputImage.className = 'canvasLogoMain';
      outputImage.id='croppedImg';

      // draw our image at position 0, 0 on the canvas
      const ctx = outputImage.getContext("2d");
      ctx.drawImage(inputImage, outputX, outputY);
      resolve(outputImage);
    };

    // start loading our image
    inputImage.src = url;

  });
}