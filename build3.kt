// /Users/namanpanwar/Maargi/android/build.gradle.kts

// Versions (kotlinVersion, agpVersion) are defined in gradle.properties

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

layout.buildDirectory.set(project.rootDir.resolve("../build"))

subprojects {
    val rootBuildDir = rootProject.layout.buildDirectory.get().asFile
    project.layout.buildDirectory.set(File(rootBuildDir, project.name))
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
