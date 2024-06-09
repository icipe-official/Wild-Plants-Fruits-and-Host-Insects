import { Box, Button, Modal, Typography } from "@mui/material";
import { useState } from "react";
import Image from "next/legacy/image";
import ZoomInIcon from "@mui/icons-material/ZoomIn";

export default function InsectPhotos({ photos_data }) {
  const photos = photos_data[0]?.insect_photos || [];
  const hasPhotos = photos.length > 0;
  const showNextImage = hasPhotos && photos.length > 1;
  const [currentImage, setCurrentImage] = useState(0);
  const hasImages = photos?.length > 0;
  const showIndicator = hasImages && photos.length > 1;
  const [showImage, setShowImage] = useState({
    showModal: false,
    isFullScreen: false,
  });

  const [open, setOpen] = useState(0);

  const closeModal = () => {
    setShowImage({
      showModal: false,
      isFullScreen: false,
    });
  };

  const toggleModal = () => {
    setShowImage((prevState) => ({
      ...prevState,
      showModal: !prevState.showModal,
      isFullScreen: !prevState.isFullScreen,
    }));
  };

  const openImage = (open) => {
    if (open === photos.length - 1) {
      setOpen(0);
    } else {
      setOpen(open + 1);
    }
  };

  return (
    <Box sx={{ marginTop: 8, marginLeft: 2, paddingBottom: 2 }}>
      {hasPhotos ? (
        <Box
          sx={{
            position: "relative",
            display: "flex",
            justifyContent: "flex-end",
            alignItems: "flex-start",
          }}
        >
          <Button
            variant="contained"
            onClick={toggleModal}
            startIcon={<ZoomInIcon />}
            style={{
              position: "absolute",
              top: 0,
              right: 0,
              zIndex: 1,
              color: "black",
              backgroundColor: "transparent",
            }}
          />
          <Image
            src={`/photos/insects/${photos[open].photo_id}.jpg`}
            alt="No Image"
            width={500}
            height={400}
          />
          {photos[open] && photos[open].sex && (
            <Box style={{ position: "absolute", bottom: 0, right: 0 }}>
              <Typography
                variant="body1"
                fontWeight="bold"
                textTransform="capitalize"
              >
                {photos[open].sex}
              </Typography>
            </Box>
          )}
        </Box>
      ) : (
        <Box>
          <Image
            src="/photos/plants/noImage.jpg"
            alt="No Image"
            width={500}
            height={400}
          />
        </Box>
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
          {hasPhotos ? (
            <>
              <Image
                src={`/photos/insects/${photos[open].photo_id}.jpg`}
                alt="No Image"
                width={showImage.isFullScreen ? 800 : 600}
                height={showImage.isFullScreen ? 600 : 400}
              />
              {photos[open] && photos[open].sex && (
                <Box style={{ position: "absolute", bottom: 0, right: 0 }}>
                  <Typography
                    variant="body1"
                    fontWeight="bold"
                    textTransform="capitalize"
                  >
                    {photos[open].sex}
                  </Typography>
                </Box>
              )}
            </>
          ) : (
            <Image
              src="/photos/plants/noImage.jpg"
              alt="No Image"
              width={showImage.isFullScreen ? 800 : 600}
              height={showImage.isFullScreen ? 600 : 400}
            />
          )}

          {showImage.isFullScreen && (
            <Button
              variant="contained"
              onClick={closeModal}
              startIcon={<ZoomInIcon />}
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

      <Box
        sx={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          marginTop: 2,
        }}
      >
        {/* <Button onClick={() => openImage(open)} className="ground">
            <Typography variant="body1" sx={{ marginRight: "10px" }}>
              Next Image
            </Typography>
            <span>{open + 1}</span>
            <span>/</span>
            <span>{photos.length}</span>
            <span style={{ marginLeft: "10%" }}>
              Specimen ID: {photos[open].photo_id}
            </span>{" "}
          </Button> */}
        <Box>
          {photos.length > 1 && (
            <>
              <button onClick={() => openImage(open)} className="ground">
                &lt;
              </button>
              <button onClick={() => openImage(open)} className="ground">
                &gt;
              </button>
              <span></span>{" "}
              <span style={{ marginRight: "5px", marginLeft: "5px" }}>
                {open + 1}/{photos.length}
              </span>
            </>
          )}
        </Box>
        <span style={{ marginLeft: "10%" }}>
          Specimen ID: {photos[open]?.photo_id}
        </span>{" "}
      </Box>

      {/* 
      {showIndicator && (
        <span>
          {currentImage + 1}/{photos.length}
        </span>
      )}
      <span style={{ marginLeft: "55%" }}>
        Specimen ID: {photos[open].photo_id}
      </span> */}
    </Box>
  );
}
