import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
// material-ui
import classNames from "classnames";
import { lighten } from "@material-ui/core/styles/colorManipulator";
import BrokenImages from "./BrokenImages";
import BrokenImageIcon from "@material-ui/icons/BrokenImage";
import CircularProgress from "@material-ui/core/CircularProgress";
import Grid from "@material-ui/core/Grid";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import TableSortLabel from "@material-ui/core/TableSortLabel";
import Toolbar from "@material-ui/core/Toolbar";
import Typography from "@material-ui/core/Typography";
import Paper from "@material-ui/core/Paper";
import Checkbox from "@material-ui/core/Checkbox";
import IconButton from "@material-ui/core/IconButton";
import Tooltip from "@material-ui/core/Tooltip";
import DeleteIcon from "@material-ui/icons/Delete";
import FilterListIcon from "@material-ui/icons/FilterList";
import { withStyles } from "@material-ui/core/styles";
import Image from "../assets/brushed-metal.jpg";
import BlackImage from "../assets/grey-brushed-metal.jpg";
import GreyImage from "../assets/brushed-metal.jpg";

function desc(a, b, orderBy) {
  if (b[orderBy] < a[orderBy]) {
    return -1;
  }
  if (b[orderBy] > a[orderBy]) {
    return 1;
  }
  return 0;
}

function stableSort(array, cmp) {
  const stabilizedThis = array.map((el, index) => [el, index]);
  stabilizedThis.sort((a, b) => {
    const order = cmp(a[0], b[0]);
    if (order !== 0) return order;
    return a[1] - b[1];
  });
  return stabilizedThis.map(el => el[0]);
}

function getSorting(order, orderBy) {
  return order === "desc"
    ? (a, b) => desc(a, b, orderBy)
    : (a, b) => -desc(a, b, orderBy);
}

const styles = theme => ({
  root: {
    width: "100%",
    marginBottom: theme.spacing.unit * 2,
    backgroundImage: `url(${BlackImage})`,
    backgroundSize: "cover",
    borderStyle: "solid",
    borderWidth: 7,
    borderColor: "#ecca00"
  },
  tableWrapper: {
    maxHeight: 500,
    overflowX: "auto"
  },
  bar: {
    backgroundImage: `url(${GreyImage})`,
    flex: 1,
    padding: `${theme.spacing.unit}px  ${theme.spacing.unit}px`,
    position: "sticky",
    top: 0,
    zIndex: 2
  },
  highlight:
    theme.palette.type === "light"
      ? {
          color: "red",
          backgroundImage: `url(${BlackImage})`
        }
      : {
          backgroundImage: `url(${GreyImage})`
        },
  actions: {
    color: theme.palette.text.secondary,
    position: "sticky",
    top: 0,
    zIndex: 2,
    borderStyle: "none"
  },
  title: {
    flex: "0 0 auto",
    position: "sticky",
    top: 0,
    zIndex: 2,
    borderStyle: "none",
    width: "100%"
  },
  cell: {
    color: "#ecca00",
    fontSize: 14
  },
  label: {
    color: "#3f51b5",
    marginLeft: theme.spacing.unit * 2
  },
  table: {
    minWidth: 750
  },
  visuallyHidden: {
    color: theme.palette.common.white,
    border: 0,
    clip: "rect(0 0 0 0)",
    height: 1,
    margin: -1,
    overflow: "hidden",
    padding: 0,
    position: "absolute",
    top: 20,
    width: 1
  },
  main: {
    marginTop: theme.spacing.unit * 5
  },
  row: {
    paddingBottom: theme.spacing.unit
  },
  link: {
    paddingRight: theme.spacing.unit * 5
  }
});

const CustomTableCell = withStyles(theme => ({
  head: {
    backgroundImage: `url(${GreyImage})`,
    fontSize: 16,
    fontWeight: 700,
    position: "sticky",
    top: 64,
    zIndex: 2,
    borderColor: "#ecca00",
    borderBottomWidth: "medium"
  },
  body: {
    fontSize: 18
  }
}))(TableCell);

const Admin = props => {
  const [records, setRecords] = useState([]);
  const [onDelete, setOnDelete] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [order, setOrder] = useState("asc");
  const [orderBy, setOrderBy] = useState("id");
  const [selected, setSelected] = useState([]);
  const [open, setOpen] = useState(false);

  const { classes } = props;

  const numSelected = selected.length;
  const recordsCount = records.length;

  const isSelected = name => selected.indexOf(name) !== -1;

  function handleDelete(selected) {
    setOnDelete(true);
    return;
  }

  function handleClearSelected(selected) {
    setSelected([]);
  }

  function handleRequestSort(event, property) {
    const isDesc = orderBy === property && order === "desc";
    setOrder(isDesc ? "asc" : "desc");
    setOrderBy(property);
  }

  function handleSelectAllClick(event) {
    if (event.target.checked) {
      const newSelecteds = records.map(n => n.id);
      setSelected(newSelecteds);
      return;
    }
    setSelected([]);
  }

  function handleClick(event, name) {
    const selectedIndex = selected.indexOf(name);
    let newSelected = [];

    if (selectedIndex === -1) {
      newSelected = newSelected.concat(selected, name);
    } else if (selectedIndex === 0) {
      newSelected = newSelected.concat(selected.slice(1));
    } else if (selectedIndex === selected.length - 1) {
      newSelected = newSelected.concat(selected.slice(0, -1));
    } else if (selectedIndex > 0) {
      newSelected = newSelected.concat(
        selected.slice(0, selectedIndex),
        selected.slice(selectedIndex + 1)
      );
    }

    setSelected(newSelected);
  }

  const createSortHandler = property => event => {
    handleRequestSort(event, property);
  };

  useEffect(() => {
    const fetchRecords = async () => {
      try {
        setIsLoading(true);
        let response = await fetch(
          `${process.env.REACT_APP_API_URL}/api/v1/users.json`,
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
        setRecords(responseJson.users);
        setIsLoading(false);
      } catch (error) {
        return error;
      }
    };
    fetchRecords();
  }, []);

  useEffect(() => {
    if (!onDelete) return;
    const deleteRecords = async () => {
      try {
        setIsLoading(true);
        let response = await fetch(
          `${process.env.REACT_APP_API_URL}/api/v1/users/:id.json`,
          {
            credentials: "same-origin",
            method: "DELETE",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${sessionStorage.jwt}`
            },
            body: JSON.stringify({ records: selected })
          }
        );
        let responseJson = await response.json();
        if (response.ok || !responseJson.status === "error") {
          setRecords(records =>
            records.filter(record => !selected.includes(record.id))
          );
          handleClearSelected();
        }
        setIsLoading(false);
      } catch (error) {
        return error;
      }
    };
    deleteRecords();
    setOnDelete(false);
  }, [onDelete, selected]);

  const headers = [
    { id: "id", label: "ID", numeric: true, disablePadding: false },
    { id: "username", label: "Username", numeric: false, disablePadding: true },
    { id: "email", label: "Email", numeric: false, disablePadding: true }
  ].map(header => {
    return (
      <CustomTableCell
        key={header.id}
        sortDirection={orderBy === header.id ? order : false}
      >
        <TableSortLabel
          className={classes.label}
          active={orderBy === header.id}
          direction={order}
          onClick={createSortHandler(header.id)}
        >
          {header.label}
          {orderBy === header.id ? (
            <span className={classes.visuallyHidden}>
              {order === "desc" ? "sorted descending" : "sorted ascending"}
            </span>
          ) : null}
        </TableSortLabel>
      </CustomTableCell>
    );
  });

  // map the result of stableSort
  const userData = stableSort(records, getSorting(order, orderBy)).map(
    (record, index) => {
      const isItemSelected = isSelected(record.id);
      const labelId = `enhanced-table-checkbox-${index}`;

      return (
        <TableRow
          hover
          onClick={event => handleClick(event, record.id)}
          role="checkbox"
          aria-checked={isItemSelected}
          tabIndex={-1}
          key={record.id}
          selected={isItemSelected}
        >
          <TableCell padding="checkbox">
            <Checkbox
              style={{ color: "#ecca00" }}
              checked={isItemSelected}
              inputProps={{ "aria-labelledby": labelId }}
            />
          </TableCell>
          <TableCell
            component="th"
            id={labelId}
            scope="row"
            className={classes.cell}
          >
            {record.id}
          </TableCell>
          <TableCell className={classes.cell}>{record.username}</TableCell>
          <TableCell className={classes.cell}>{record.email}</TableCell>
        </TableRow>
      );
    }
  );
  // <Grid container className={classes.grd} direction="column">
  // <Grid className={classes.title} />
  // <Grid className={classes.title} />
  return (
    <>
      <Grid container className={classes.main} justify="center">
        <Grid item xs={10}>
          {isLoading && <CircularProgress />}
          <Paper className={classes.root}>
            <div className={classes.tableWrapper}>
              <Grid
                container
                alignItems="center"
                className={classNames(classes.bar, {
                  [classes.highlight]: numSelected > 0
                })}
              >
                <Grid item xs={6} className={classes.title}>
                  {numSelected > 0 ? (
                    <Typography style={{ color: "#ecca00" }} variant="h6">
                      {numSelected} selected
                    </Typography>
                  ) : (
                    <Typography
                      variant="h4"
                      id="tableTitle"
                      align="left"
                      className={classes.label}
                    >
                      Users
                    </Typography>
                  )}
                </Grid>
                <Grid item xs={6} className={classes.actions} align="right">
                  {numSelected === 1 ? (
                    <Tooltip title="Broken Images">
                      <IconButton
                        aria-label="broken image"
                        onClick={() => setOpen(true)}
                      >
                        <BrokenImageIcon style={{ color: "#ecca00" }} />
                      </IconButton>
                    </Tooltip>
                  ) : null}
                  {numSelected > 0 ? (
                    <Tooltip title="Delete">
                      <IconButton
                        aria-label="delete"
                        onClick={() => handleDelete(selected)}
                      >
                        <DeleteIcon style={{ color: "#ecca00" }} />
                      </IconButton>
                    </Tooltip>
                  ) : (
                    <Tooltip title="Filter list">
                      <IconButton aria-label="filter list">
                        <FilterListIcon />
                      </IconButton>
                    </Tooltip>
                  )}
                </Grid>
              </Grid>
              <Table size="small" aria-labelledby="tableTitle">
                <TableHead>
                  <TableRow className={classes.row}>
                    <CustomTableCell padding="checkbox">
                      <Checkbox
                        style={{ color: "#3f51b5" }}
                        indeterminate={
                          numSelected > 0 && numSelected < recordsCount
                        }
                        checked={numSelected === recordsCount}
                        onChange={handleSelectAllClick}
                      />
                    </CustomTableCell>
                    {headers}
                  </TableRow>
                </TableHead>
                {open ? (
                  <BrokenImages
                    open={open}
                    setOpen={setOpen}
                    selected={selected}
                    records={records}
                  />
                ) : null}
                <TableBody>{userData}</TableBody>
              </Table>
            </div>
          </Paper>
        </Grid>
      </Grid>
      <Grid container item xs={10} justify="flex-end" className={classes.link}>
        <Link to="/ms/media_update" style={{ color: "#ecca00" }}>
          <Typography variant="h4" style={{ color: "#ecca00" }}>
            Fixes
          </Typography>
        </Link>
      </Grid>
    </>
  );
};

export default withStyles(styles)(Admin);
