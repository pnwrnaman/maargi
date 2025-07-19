// /Users/namanpanwar/Maargi/android/build.gradle.kts

buildscript {
    // Define versions needed by buildscript directly within its scope
    val kotlinVersionForBuildscript = "1.8.22"
    val agpVersionForBuildscript = "8.1.0"

    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:$agpVersionForBuildscript")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlinVersionForBuildscript")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = file("../build") // Using file() helper for clarity
subprojects {
    project.buildDir = File(rootProject.buildDir, project.name) // Using File constructor for robustness
}

// Removed custom clean logic that caused build errors

// If you need to use these versions elsewhere in this root script or in subprojects,
// you can define them here as top-level properties again, or preferably,
// put them in a gradle.properties file.
// For example:
// val globalKotlinVersion = "1.8.22"
// val globalAgpVersion = "8.1.0"

// Removed invalid android { ndkVersion ... } block that caused build errors