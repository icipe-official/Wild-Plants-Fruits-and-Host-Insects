import { Box, Button, Modal } from "@mui/material";
import { useState } from "react";
import Image from "next/legacy/image";
import ZoomInIcon from "@mui/icons-material/ZoomIn";

export default function InsectPhotos({ photos_data }) {
  const photos = photos_data[0]?.insect_photos.map((y) => y.photo_id) || [];
  const hasPhotos = photos.length > 0;
  const showNextImage = hasPhotos && photos.length > 1;

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
            src={`/insectPhotos/${photos[open]}.jpg`}
            alt="No Image"
            width={500}
            height={400}
          />
        </Box>
      ) : (
        <Box>
          <Image
            src="/plantPhotos/noImage.jpg"
            alt="No Image"
            width={500}
            height={400}
          />
        </Box>
      )}

      {showNextImage && (
        <span>
          {open + 1}/{photos.length}
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
          <Image
            src={`/insectPhotos/${photos[open]}.jpg`}
            alt="No Image"
            width={showImage.isFullScreen ? 800 : 600}
            height={showImage.isFullScreen ? 600 : 400}
          />

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

      {showNextImage && (
        <Box>
          <Button onClick={() => openImage(open)} className="ground">
            Next Image
          </Button>
        </Box>
      )}
    </Box>
  );
}
