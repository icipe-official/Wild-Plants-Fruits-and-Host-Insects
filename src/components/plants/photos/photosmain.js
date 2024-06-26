import { Box, Button, Modal, Tooltip } from "@mui/material";
import { useState } from "react";
import Image from "next/legacy/image";
import ZoomInIcon from "@mui/icons-material/ZoomIn";
import FullscreenExitIcon from "@mui/icons-material/FullscreenExit";
import { ZoomOut } from "@mui/icons-material";
export default function PhotosComponent({ photos_data, selectedIndex }) {
  // console.log("photos_data");

  if (typeof photos_data !== "undefined") {
    const photos = photos_data[selectedIndex]?.plants_photos?.map(
      (p) => p?.photo_name
    );
    // console.log(photos_data);

    // console.log("photos");

    // console.log(photos);
    const imagePaths = photos?.map((specie) => `/photos/plants/${specie}`);
    const hasImages = photos?.length > 0;
    const showIndicator = hasImages && photos.length > 1;

    const [showImage, setShowImage] = useState({
      showModal: false,
      isFullScreen: false,
    });

    const [currentImage, setCurrentImage] = useState(0);

    const closeModal = () => {
      setShowImage({
        showModal: false,
        isFullScreen: false,
      });
    };

    const toggleModal = () => {
      if (showImage.isFullScreen) {
        setShowImage((prevState) => ({
          isFullScreen: false,
        }));
      } else {
        setShowImage((prevState) => ({
          showModal: !prevState.showModal,
          isFullScreen: true,
        }));
      }
    };

    const previousImage = () => {
      setCurrentImage((prevImage) =>
        prevImage === 0 ? photos.length - 1 : prevImage - 1
      );
    };

    const nextImage = () => {
      setCurrentImage((prevImage) =>
        prevImage === photos.length - 1 ? 0 : prevImage + 1
      );
    };

    const imageComponent = hasImages ? (
      <Image
        src={imagePaths[currentImage]}
        alt="No Image"
        width={showImage.isFullScreen ? 800 : 500}
        height={showImage.isFullScreen ? 600 : 400}
      />
    ) : (
      <Image
        src="/photos/plants/noImage.jpg"
        alt="No Image"
        width={showImage.isFullScreen ? 800 : 500}
        height={showImage.isFullScreen ? 600 : 400}
      />
    );

    return (
      <Box sx={{ marginTop: "1rem", paddingBottom: 2 }}>
        <Box
          sx={{
            position: "relative",
            display: "flex",
            justifyContent: "flex-end",
            alignItems: "flex-start",
          }}
        >
          {imageComponent}
          {hasImages && (
            <Button
              variant="contained"
              onClick={toggleModal}
              startIcon={
                <Tooltip title="Zoom in">
                  <ZoomInIcon />
                </Tooltip>
              }
              style={{
                position: "absolute",
                top: 0,
                right: 0,
                zIndex: 1,
                color: "white",
                backgroundColor: "transparent",
              }}
            />
          )}
        </Box>
        {showIndicator && (
          <span>
            {currentImage + 1}/{photos.length}
          </span>
        )}
        {photos.length > 0 && (
          <span style={{ marginLeft: "50%" }}>
            Specimen ID: {photos[currentImage]?.split(".")[0]}
          </span>
        )}
        <Modal
          open={showImage.showModal}
          onClose={toggleModal}
          aria-labelledby="image-modal"
          aria-describedby="image-modal-description"
        >
          <Box
            sx={{
              position: "absolute",
              top: "50%",
              left: "50%",
              transform: "translate(-50%, -50%)",
              bgcolor: "background.paper",
              boxShadow: 24,
              p: 4,
            }}
          >
            {imageComponent}
            {showImage.isFullScreen && (
              <Button
                variant="contained"
                onClick={closeModal}
                startIcon={
                  <Tooltip title="Zoom out">
                    <ZoomOut />
                  </Tooltip>
                }
                style={{
                  position: "absolute",
                  top: 0,
                  right: 0,
                  zIndex: 1,
                  color: "black",
                  backgroundColor: "transparent",
                }}
              />
            )}
          </Box>
        </Modal>
        {showIndicator && !showImage.isFullScreen && (
          <Box>
            <button onClick={previousImage} className="ground">
              &lt;
            </button>
            <button onClick={nextImage} className="ground">
              &gt;
            </button>
          </Box>
        )}
      </Box>
    );
  }
}
