# php

When you want to add `use` command in top of your php file, you should define your namespace.

Instanitaiting a class:
```php
// Using ::class to get the fully qualified class name
$className = MyClass::class;

echo $className; // Outputs: MyNamespace\MyClass
```

Reading a value from config:
```php
$value = config('app.timezone');
```

In the example above, you should define the app config like this and put it in `app.php` configuration file in Config directory of the framework:
```php
// Set a configuration value at runtime
config(['app.timezone' => 'America/New_York']);
```
Getting connection to a Redis:
```php
/** @var Redis $redis */
private $redis;

$this->redis = Redis::connection('ban_drivers');
```