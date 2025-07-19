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
// It's generally recommended to set this in settings.gradle.kts if possible,
// or ensure it's configured early.
// For the root project:
layout.buildDirectory.set(project.rootDir.resolve("../build"))

subprojects {
    // For subprojects, their build directory will be relative to the root project's build directory by default.
    // If you need to customize it further based on the root's custom location:
    // This calculation needs to be relative to the subproject's own projectDir if you want them nested
    // under the custom root build dir.
    // A common pattern is that subprojects build into `rootProject.buildDir/subprojectName`.
    // Gradle usually handles this correctly if the root buildDir is set.
    // Let's ensure subprojects are placed within the custom root build directory.
    val rootBuildDir = rootProject.layout.buildDirectory.get().asFile
    project.layout.buildDirectory.set(File(rootBuildDir, project.name))
}

tasks.register<Delete>("clean") {
    // The delete method of the Delete task can take a File object directly.
    // The previous error might have been due to how rootProject.buildDir (deprecated getter) was resolved.
    // Using the layout API to get the directory should be more robust.
    delete(rootProject.layout.buildDirectory)
}

