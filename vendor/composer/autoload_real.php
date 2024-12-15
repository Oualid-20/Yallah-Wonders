<?php

// autoload_real.php @generated by Composer

class ComposerAutoloaderInitaae6b6a0c6b63689ded880c2982dd7c3
{
    private static $loader;

    public static function loadClassLoader($class)
    {
        if ('Composer\Autoload\ClassLoader' === $class) {
            require __DIR__ . '/ClassLoader.php';
        }
    }

    /**
     * @return \Composer\Autoload\ClassLoader
     */
    public static function getLoader()
    {
        if (null !== self::$loader) {
            return self::$loader;
        }

        require __DIR__ . '/platform_check.php';

        spl_autoload_register(array('ComposerAutoloaderInitaae6b6a0c6b63689ded880c2982dd7c3', 'loadClassLoader'), true, true);
        self::$loader = $loader = new \Composer\Autoload\ClassLoader(\dirname(__DIR__));
        spl_autoload_unregister(array('ComposerAutoloaderInitaae6b6a0c6b63689ded880c2982dd7c3', 'loadClassLoader'));

        require __DIR__ . '/autoload_static.php';
        call_user_func(\Composer\Autoload\ComposerStaticInitaae6b6a0c6b63689ded880c2982dd7c3::getInitializer($loader));

        $loader->register(true);

        return $loader;
    }
}