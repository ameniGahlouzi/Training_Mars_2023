<!DOCTYPE html>
<html>
  <head>
    <title>My MongoDB Table</title>
    <style>
      /* Style the table */
table {
  border-collapse: collapse;
  width: 100%;
  margin-bottom: 20px;
}

/* Style the table header */
th {
  background-color: #008CBA;
  color: white;
  text-align: left;
  padding: 8px;
}

/* Style the table rows */
tr:nth-child(even) {
  background-color: #f2f2f2;
}

/* Style the table data cells */
td {
  border: 1px solid #ddd;
  padding: 8px;
}
    </style>
  </head>
  <body>
  <?php


// Connect to MongoDB server
$manager = new MongoDB\Driver\Manager("mongodb://10.0.0.100:27017");

$query = new MongoDB\Driver\Query(array());


// Fetch all documents in the collection
$cursor = $manager->executeQuery('test.items', $query);


// Display each document in a table
echo "<table>";
echo "<tr><th>ID</th><th>Name</th></tr>";
foreach ($cursor as $item) {
    echo "<tr>";
    echo "<td>" . $item->_id . "</td>";
    echo "<td>" . $item->name . "</td>";
    echo "</tr>";
}
echo "</table>";

?>
  </body>
</html>

