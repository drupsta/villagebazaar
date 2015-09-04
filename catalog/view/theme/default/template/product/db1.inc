<?php
  /**
   * Database abstraction layer.
   * This file is part of CompInaBox.
   * @copyright Copyright 2001-2005. Eric D. Nielsen, All rights reserverd.
   * @license http://opensource.org/licenses/gpl-license.php GNU Public License
   * @author Eric D. Nielsen <nielsene@alum.mit.edu>
   *
   * @package Database
   * @filesource
   */
 
  /** 
   * A minimal Database abstraction layer.
   * This class offers a very minimal database abstraction layer.
   * CompInaBox is designed to run on top of the PostGreSQL Relational
   * DataBase Management System and requires many of its features.
   * Therefore database independence wasn't a huge concern.  However having
   * a single place to funnel all queries through is useful for future
   * instrumentation work.
   * @package Database
   */
class DB
{
  /**
   * @var object $db the database connection
   * @access private
   */
  var $db;
  /**
   * @var int $lastOID the last assigned object/row identifier, deprecated
   * @access private
   */
  var $lastOID;
  /**
   * @var string $user the username connected as
   * @access private
   */
  var $user;
  /**
   * @var string $password the password used to connect
   * @access private
   */
  var $password;
  /**
   * @var string $dbname the database connected to
   * @access private
   */
  var $dbname;
  
  /**
   * DB Constructor
   * @access public
   * @internal If your database is not on the same server as your web server
   *  you will need to add a host=host.domain part to the connection string in the
   *  source code
   *
   * @param string $dbname what database do you want to connect to
   * @param string $user as what user
   * @param string $password which what password
   */
  function DB($dbname, $user, $pass)
  {
    $this->db = pg_connect("dbname=$dbname user=$user password=$pass");
    $this->lastOID=0;
    $this->dbname=$dbname;
    $this->user=$user;
    $this->password=$pass;
  }
 
  /**
   * Execute a query against the Database
   * Preforms the query, returns a QueryResult in all cases,
   * however the QueryResult is only useful in cases of SELECT
   * queries.  INSERTS will update the lastOID member variable.
   * Error conditions are indiated in the returned QueryResult.
   *
   * @access public
   * @param string $query the SQL query to execute
   * @return QueryResult the result of executing the query
   */
    function query($query)
    {
    $r = new QueryResult();
#    echo "<br>$query";
    $result = pg_exec($this->db, $query);
    if (!$result)
    {
        $r->setError("Error executing query");
        return $r;
    }
    if (stristr($query,"INSERT"))
    {
        $this->lastOID=pg_getlastoid($result);
    }
    $num = pg_numrows($result);
    for ($i=0;$i<$num;$i++)
    {
        $temp = pg_fetch_row($result,$i);
        if (!$temp)
        {
        $r->setError("Error retrieving row $i");
        return $r;
        }
        $r->addRow($temp);
    }
    return $r;
    }
 
    /**
     * Get the last assigned OID
     * @deprecated please use SELECT nextval(seq_name) queries
     * @return int the last assigned OID
     * @access public
     */
    function getLastOID()
    {
    return $this->lastOID;
    }
 
    /**
     * Start an extended transaction block
     * Turn off auto-commit and begin an extended transaction
     * block with the given isolation level.
     *
     * @access public
     * @param string $level the desired isolation level either SERIALIZABLE or READ COMMITTED
     *  defaulting to the former
     * @internal Note: that this defaults to the strictest transaction
     *  isolation level.  There is no support at present for the nested
     *  tranactions or save points.
     */
    function startTransaction($level="SERIALIZABLE")
    {
      $query = "BEGIN WORK;";
      $this->query($query);
      if ($level != "SERIALIZABLE" && $level != "READ COMMITTED")
    $level = "SERIALIZABLE";
      $query = "SET TRANSACTION ISOLATION LEVEL $level;";
      $this->query($query);
    }
 
    /**
     * Commit an extended transaction block
     * Commit an extend transaction begun by startTransaction
     * @access public
     */
   function commit()
   {
     $query = "COMMIT WORK;";
     $this->query($query);
   }
 
    /**
     * Abort/Rollback an extended transaction block
     * Abort/Rollback an extend transaction begun by startTransaction
     * @access public
     */
   function rollback()
   {
     $query = "ROLLBACK WORK;";
     $this->query($query);
   }
 
    /**
     * Execute a query that returns a single scalar value
     * A convienence function used to unpack the QueryResult
     * when a single value is expected, for use in cases like
     * SELECT count(*) FROM ...
     *
     * @access protected
     * @todo Change to public and rename
     * @param string $query the query to execute
     * @return mixed a scalar answer to the query
     */
  function helper_singleValueQuery($query)
    {
      $result = $this->query($query);
      if ($result->numrows())
    list($value)  = $result->getRowAt(0);
      else
    $value="";
      return $value;
    }
 
    /**
     * Execute a query that returns a list of scalar values
     * A convienence function used to unpack the QueryResult
     * when a list of single column values is expected,
     * for use in cases like SELECT id FROM ...
     *
     * @access protected
     * @todo Change to public and rename
     * @param string $query the query to execute
     * @return array a list in answer to the query
     */
  function helper_queryToSimpleArray($query)
    {
      $result = $this->query($query);
      $numItems = $result->numrows();
      for ($i = 0; $i < $numItems; $i++)
    {
      list($value) = $result->getRowAt($i);
      $items[]=$value;
    }
      return $items;
    }
 
    /**
     * Execute a query that returns a list of paired values
     * A convienence function used to unpack the QueryResult
     * when a a list of links is expected, the first column
     * of each row is used as the label, with the second as
     * the link information.  Used mainly for navigation elements.
     *
     * @access protected
     * @todo Change to public and rename
     * @param string $query the query to execute
     * @return array a list in answer to the query
     */
  function helper_queryToArray($query)
    {
      $result = $this->query($query);
      $items=array();
      $numItems = $result->numrows();
      for ($i = 0; $i < $numItems; $i++)
    {
      list($name,$link) = $result->getRowAt($i);
      $items[$i]=array("Label"=>$name,"Link"=>$link);
    }
      return $items;
    }
  
    /**
     * Execute a query that returns a list of paired values organized into categories
     * A convienence function used to unpack the QueryResult
     * when a a list of links is expected, the first column
     * of each row is used as a category, the second as the label,
     * with the third as the link information.  Used mainly for navigation elements.
     *
     * @access protected
     * @todo Change to public and rename
     * @param string $query the query to execute
     * @return array a list in answer to the query
     */
  function helper_queryToArrayCategories($query)
    {
      $result = $this->query($query);
      $items=array();
      $numItems = $result->numrows();
      for ($i = 0; $i < $numItems; $i++)
    {
      
      list($cat,$name,$link) = $result->getRowAt($i);
      $items[$cat][]=array("Label"=>$name,"Link"=>$link);
    }
      return $items;
    }
 
    /**
     * returns a LIMIT n OFFSET m modification to a query.
     * A convienence function used add LIMIT/OFFSET information
     * to an existing query.
     *
     * @access protected
     * @todo Change to public and rename
     * @param int $limit how many items to return from the DB
     * @param int $offset where to start in the DB result set
     * @return string the additional piece to tack onto the query
     */
  function helper_limitOffset($limit,$offset)
    {
      $query = "";
      if ($limit!="")
    $query .= "LIMIT $limit ";
      if ($offset!="")
    $query .= "OFFSET $offset ";
      return $query;
    }
  /**
   * Returns the database in use
   * @internal This function is almost only used to
   *  upgrade/downgrade a database connection to a
   *  different user
   * @return string the database connected to
   * @access public
   */
  function getDBName()
  {
    return $this->dbname;
  }
 
  /**
   * Returns the database user connected as
   * @internal This function is almost only used to
   *  upgrade/downgrade a database connection to a
   *  different user
   * @return string the current database user
   * @access public
   */
  function getDBuser()
  {
    return $this->user;
  }
 
  /**
   * Returns the current user's database password
   * @internal This function is almost only used to
   *  upgrade/downgrade a database connection to a
   *  different user
   * @return string the passwod of the current user
   * @todo remove the password and look up from the config file?
   * @access public
   */
  function getDBpass()
  {
    return $this->password;
  }
 
}
?>
