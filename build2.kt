// /Users/namanpanwar/Maargi/android/build.gradle.kts

// Versions (kotlinVersion, agpVersion) are now defined in gradle.properties
// and are automatically available as project properties.

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:${project.property("agpVersion") as String}")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:${project.property("kotlinVersion") as String}")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Configure build directories using the layout API
// For the root project:
// project.rootDir is /Users/namanpanwar/Maargi/android/
// project.rootDir.resolve("../build") is /Users/namanpanwar/Maargi/build/
layout.buildDirectory.set(project.rootDir.resolve("../build")) // Line 25 area

subprojects {
    // For subprojects, their build directory will be relative to the root project's build directory.
    val rootBuildDir = rootProject.layout.buildDirectory.get().asFile
    project.layout.buildDirectory.set(File(rootBuildDir, project.name)) // Line 27 area
}

tasks.register<Delete>("clean") { // Line 30 (approx, depending on exact line count)
    // Use the Gradle Delete task's own delete method and the modern layout API
    delete(rootProject.layout.buildDirectory) // Line 31 - THIS IS THE FIX
}

