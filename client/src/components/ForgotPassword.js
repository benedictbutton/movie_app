import React, { useState, useReducer, useEffect } from "react";
import { useForgot } from "../util/CustomHooks";
// material-ui
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import TextField from "@material-ui/core/TextField";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  button: {
    textTransform: "none",
    "&:hover": {
      background: "none"
    }
  }
});

const initialState = {
  isLoading: false,
  isError: false,
  response: null
};

const forgotReducer = (state = initialState, action) => {
  switch (action.type) {
    case "REQUESTING":
      return { ...state, isLoading: true };
    case "SUCCESS":
      return { ...state, isLoading: false, response: action.action };
    case "ERROR":
      return {
        ...state,
        isLoading: false,
        isError: true,
        response: action.responseJson
      };
    default:
      return state;
  }
};

const ForgotPassword = props => {
  const { classes, open, handleOpen, handleClose } = props;
  const [ignore, setIgnore] = useState(false);
  const [payload, setPayload] = useState("");
  const [state, dispatch] = useReducer(forgotReducer, initialState);

  const forgot = () => {
    setIgnore(true);
    setPayload(input);
  };

  const { input, handleChange, handleForgot } = useForgot(forgot);

  useEffect(
    () => {
      if (ignore === false) return;
      const postData = async () => {
        setIgnore(false);
        dispatch({ type: "REQUESTING" });
        try {
          let response = await fetch(
            `${process.env.REACT_APP_API_URL}/forgot_password.json`,
            {
              credentials: "same-origin",
              method: "POST",
              headers: {
                "Content-Type": "application/json"
              },
              body: JSON.stringify(payload)
            }
          );
          let responseJson = await response.json();
          if (!response.ok || responseJson.status === "error") {
            dispatch({ type: "ERROR", action: responseJson });
            throw responseJson;
          }
          dispatch({ type: "SUCCESS", action: responseJson });
        } catch (error) {
          return error;
        }
      };
      postData();
    },
    [ignore, payload, state]
  );

  return (
    <div>
      <Button
        className={classes.button}
        variant="text"
        size="medium"
        align="center"
        onClick={handleOpen}
      >
        Forgot Password?
      </Button>
      <Dialog
        open={open}
        onClose={() => {
          handleClose();
          dispatch({ type: "SUCCESS", action: null });
        }}
        aria-labelledby="form-dialog-title"
      >
        <DialogTitle id="form-dialog-title">Reset Password</DialogTitle>
        {!state.isLoading && state.response === null ? (
          <form onSubmit={handleForgot}>
            <DialogContent>
              <DialogContentText>
                Please enter your email address below and SEND. A message will
                be sent to your inbox containing a link that will allow you to
                create a new password.
              </DialogContentText>
              <TextField
                margin="dense"
                id="forgot"
                name="email"
                onChange={handleChange}
                value={input.email || ""}
                label="Email Address"
                type="email"
                fullWidth
              />
            </DialogContent>
            <DialogActions>
              <Button
                onClick={() => {
                  handleClose();
                  dispatch({ type: "SUCCESS", action: null });
                }}
                color="primary"
              >
                Cancel
              </Button>
              <Button type="submit" color="primary">
                Send
              </Button>
            </DialogActions>
          </form>
        ) : (
          <>
            <DialogContent>
              <DialogContentText>
                A link to reset your password has been sent to {input.email}. Be
                sure to check your spam/junk folder for receipt if not in your
                inbox.
              </DialogContentText>
            </DialogContent>
            <DialogActions>
              <Button
                onClick={() => {
                  handleClose();
                  dispatch({ type: "SUCCESS", action: null });
                }}
                color="primary"
              >
                Ok
              </Button>
            </DialogActions>
          </>
        )}
      </Dialog>
    </div>
  );
};

export default withStyles(styles)(ForgotPassword);
