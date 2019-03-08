import { normalize } from "normalizr";
import { listSchema, movieSchema } from "../schemas/schema";
import CustomError from "../../util/CustomError";

async function fetchPlaylists() {
  try {
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/api/v1/playlists.json`,
      {
        credentials: "same-origin",
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.jwt}`
        }
      }
    );
    let responseJson = await response.json();
    if (!response.ok)
      throw new CustomError(responseJson.message, responseJson.code);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

async function fetchPlaylist(query) {
  try {
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/api/v1/playlists/${query}`,
      {
        credentials: "same-origin",
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.jwt}`
        }
      }
    );
    let resolvedResponse = await response.json();
    if (!response.ok)
      throw new CustomError(resolvedResponse.message, resolvedResponse.code);
    const responseJson = normalize(resolvedResponse, [movieSchema]);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

async function fetchDefaultPlaylist() {
  try {
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/api/v1/playlists/active`,
      {
        credentials: "same-origin",
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.jwt}`
        }
      }
    );
    let responseJson = await response.json();
    if (!response.ok)
      throw new CustomError(responseJson.message, responseJson.code);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

async function postPlaylist(payload) {
  try {
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/api/v1/playlists.json`,
      {
        credentials: "same-origin",
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.jwt}`
        },
        body: JSON.stringify(payload)
      }
    );
    let responseJson = await response.json();
    if (!response.ok) throw new Error(responseJson.error);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

async function postPlaylistMovie(payload) {
  try {
    let id = payload.id;
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/api/v1/playlists/${id}.json`,
      {
        credentials: "same-origin",
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.jwt}`
        },
        body: JSON.stringify(payload)
      }
    );
    let responseJson = await response.json();
    if (!response.ok)
      throw new CustomError(responseJson.message, responseJson.code);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

async function ditchPlaylistMovie(payload) {
  try {
    let id = payload.id;
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/api/v1/movies_playlists/${id}.json`,
      {
        credentials: "same-origin",
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.jwt}`
        },
        body: JSON.stringify(payload)
      }
    );
    let responseJson = await response.json();
    if (!response.ok)
      throw new CustomError(responseJson.message, responseJson.code);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

export {
  fetchPlaylists,
  fetchPlaylist,
  fetchDefaultPlaylist,
  postPlaylist,
  postPlaylistMovie,
  ditchPlaylistMovie
};
