<?php
/**
 * Database Configuration
 *
 * All of your system's database connection settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/DbConfig.php.
 */
$url = parse_url(getenv('DATABASE_URL'));

return [
    'driver' => 'psql',
    'server' => $url['host'],
    'user' => $url['user'],
    'password' => $url['password'],
    'database' => ltrim($url['path'], '/'),
    'schema' => 'public',
    'tablePrefix' => getenv('DB_TABLE_PREFIX'),
    'port' => $url['port']
];
