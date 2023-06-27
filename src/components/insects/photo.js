import { Box, Button, Modal } from "@mui/material";
import { useState } from "react";
import Image from "next/legacy/image";
import Router from "next/router";
import ZoomInIcon from "@mui/icons-material/ZoomIn";
import FullscreenExitIcon from "@mui/icons-material/FullscreenExit";
import ZoomOutIcon from "@mui/icons-material/ZoomOut";

export default function InsectPhotos({ photos_data }) {
  const base_path = process.env.NEXT_PUBLIC_BASE_PATH ? `${process.env.NEXT_PUBLIC_BASE_PATH}` : "";
  const photos = photos_data.map((insect) =>
    insect.insect_photos.map((y) => y.photo_id)
  )[0]; // [0] extract photonames from [[]] object

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

  const OpenImage = (open) => {
    if (open === photos.length - 1) {
      setOpen(0);
    } else {
      setOpen(open + 1);
    }
  };

  return (
    <Box sx={{ marginTop: 8, marginLeft: 2, paddingBottom: 2 }}>
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
          sx={{
            position: "absolute",
            top: 0,
            right: 0,
            zIndex: 1,
          }}
        />
        <Image
          src={`${base_path}/photos/insects/${photos[open]}.jpg`}
          alt="No Image"
          width={500}
          height={400}
        />
      </Box>
      <span>
        {open + 1}/{photos.length}
      </span>

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
            src={`${base_path}/photos/insects/${photos[open]}.jpg`}
            alt="No Image"
            width={showImage.isFullScreen ? 800 : 600}
            height={showImage.isFullScreen ? 600 : 400}
          />
          {showImage.isFullScreen && (
            <Button
              variant="contained"
              onClick={closeModal}
              startIcon={<ZoomInIcon />}
              sx={{
                position: "absolute",
                top: 0,
                right: 0,
                zIndex: 1,
              }}
            />
          )}
        </Box>
      </Modal>

      {!showImage.isFullScreen && (
        <Box>
          <Button onClick={() => OpenImage(open)} className="ground">
            Next Image
          </Button>
        </Box>
      )}
    </Box>
  );
}
