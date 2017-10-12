<?php
/**
 * Database Configuration
 *
 * All of your system's database connection settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/DbConfig.php.
 */
$url = parse_url(getenv($DATABASE_URL));

$db_driver = getenv('DB_DRIVER') ?: 'psql';
$db_server = getenv('DB_SERVER') ?: $url['host'];
$db_user = getenv('DB_USER') ?: $url['user'];
$db_password = getenv('DB_PASSWORD') ?: $url['password'];
$db_database = getenv('DB_DATABASE') ?: ltrim($url['path'], '/');
$db_schema = getenv('DB_SCHEMA') ?: 'public';
$db_table_prefix = getenv('DB_TABLE_PREFIX') ?: '';
$db_port = getenv('DB_PORT') ?: $url['port'];

return [
    'driver' => $db_driver,
    'server' => $db_server,
    'user' => $db_user,
    'password' => $db_password,
    'database' => $db_database,
    'schema' => $db_schema,
    'tablePrefix' => $db_table_prefix,
    'port' => $db_port
];

