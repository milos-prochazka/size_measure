
import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io' show Platform;


class MediaSize
{
    /// Internal MediaQueryData object 
    late final MediaQueryData media;

    /// Convert constant device logical pixels to inch
    late final double pixelsPerInch;

    /// Convert constant device logical pixels to mimimeter
    late final double pixelsPerMM;

    /// Constructor from BuildContext
    MediaSize (BuildContext context)
    {
        media = MediaQuery.of(context);
        pixelsPerInch = ( Platform.isAndroid || Platform.isIOS? 150 : 96);
        pixelsPerMM = pixelsPerInch / 25.4;
        
    }

    /// Converts logical pixels to device-dependent pixels
    double pixelsToDPx(var pixels) => media.devicePixelRatio * pixels;

    /// Converts device-dependent pixels to logical pixels
    double dpxToPixels(var dpx) => dpx / media.devicePixelRatio;

    /// Converts inches to logical pixels
    double inchesToPixels(var inches) => pixelsPerInch*inches;

    /// Converts logical pixels to inches 
    double pixelsToInches(var pixels) => pixels / pixelsPerInch;

    /// Converts milimeters to logical pixels 
    double mmToPixels(var mm) => pixelsPerMM*mm;

    /// Converts logical pixels to milimeters  
    double pixelsToMM(var pixels) => pixels / pixelsPerMM;

    /// Converts Size in logical pixels to inches  
    Size sizeToInches(Size size) => Size(size.width / pixelsPerInch , size.height / pixelsPerInch);
    
    /// Converts Size in inches to logical pixels    
    Size sizePixelsToInches(Size size) => Size(size.width * pixelsPerInch , size.height * pixelsPerInch);

    /// Converts Size in logical pixels to milimeters  
    Size sizeToMM(Size size) => Size(size.width / pixelsPerMM , size.height / pixelsPerMM);
    
    /// Converts Size in milimeters to logical pixels   
    Size sizePixelsToMM(Size size) => Size(size.width * pixelsPerMM , size.height * pixelsPerMM);

    /// Converts Size in logical pixels to device-dependent pixels  
    Size sizeToDpx(Size size) => Size(size.width / media.devicePixelRatio , size.height / media.devicePixelRatio);
    
    /// Converts Size in device-dependent pixels to logical pixels    
    Size sizePixelsToDpx(Size size) => Size(size.width * media.devicePixelRatio , size.height * media.devicePixelRatio);

    /// Screen width in logical pixels
    double get screenWidth => media.size.width;

    /// Screen height in logical pixels
    double get screenHeight => media.size.height;

    /// Screen width in device-dependent pixels
    double get screenWidthDpx => media.size.width * media.devicePixelRatio;

    /// Screen height in device-dependent pixels
    double get screenHeightDpx => media.size.height * media.devicePixelRatio;

    /// Screen width in inches
    double get screenWidthInches => media.size.width / pixelsPerInch;

    /// Screen height in inches
    double get screenHeightInches => media.size.height / pixelsPerInch;

    /// Screen width in milimeters
    double get screenWidthMM => media.size.width / pixelsPerMM;

    /// Screen height in milimeters
    double get screenHeightMM => media.size.height / pixelsPerMM;

    /// Return true if device in landscape orientation
    bool get isLandscape => media.orientation == Orientation.landscape;

    /// Return true if device in portait orientation
    bool get isPortrait => media.orientation == Orientation.portrait;
}

/// Unit names
enum DistanceUnit
{
    Px,Dpx,Inch,MM
}

/// 
class NamedDistance
{
      double value;
      DistanceUnit unit;

      NamedDistance(this.value,this.unit);

      /// Returns the size in logical pixels
      double toPixels(MediaSize mediaSize) => sizeToPixels(value, unit, mediaSize);

      /// Returns the size in device-dependent pixels
      double toDpx(MediaSize mediaSize) => sizeToDpx(value, unit, mediaSize);

      /// Returns the size in milimeters
      double toMM(MediaSize mediaSize) => sizeToMM(value, unit, mediaSize);

      /// Returns the size in inches
      double toInches(MediaSize mediaSize) => sizeToInches(value, unit, mediaSize);

      /// Static function. Converts the length in the specified units to logical pixels.
      static double sizeToPixels(double size, DistanceUnit unit,MediaSize mediaSize)
      {
          switch(unit)
          {
              case DistanceUnit.Px:
                  return size;
              case DistanceUnit.Dpx:
                  return mediaSize.dpxToPixels(size);
              case DistanceUnit.MM:
                  return mediaSize.mmToPixels(size);
              case DistanceUnit.Inch:
                  return mediaSize.inchesToPixels(size);
          }
      }

      /// Static function. Converts the length in the specified units to device-dependent pixels.
      static double sizeToDpx(double size, DistanceUnit unit,MediaSize mediaSize)
      {
          switch(unit)
          {
              case DistanceUnit.Px:
                  return mediaSize.pixelsToDPx(size);
              case DistanceUnit.Dpx:
                  return size;
              case DistanceUnit.MM:
                  return mediaSize.media.devicePixelRatio * mediaSize.mmToPixels(size);
              case DistanceUnit.Inch:
                  return mediaSize.media.devicePixelRatio * mediaSize.inchesToPixels(size);
          }
      }

      /// Static function. Converts the length in the specified units to milimeters.
      static double sizeToMM(double size, DistanceUnit unit,MediaSize mediaSize)
      {
          switch(unit)
          {
              case DistanceUnit.Px:
                  return mediaSize.pixelsToMM(size);
              case DistanceUnit.Dpx:
                  return  mediaSize.pixelsToMM(size) / mediaSize.media.devicePixelRatio;
              case DistanceUnit.MM:
                  return size;
              case DistanceUnit.Inch:
                  return size / 25.4;
          }
      }

      /// Static function. Converts the length in the specified units to inches.
      static double sizeToInches(double size, DistanceUnit unit,MediaSize mediaSize)
      {
          switch(unit)
          {
              case DistanceUnit.Px:
                  return mediaSize.pixelsToInches(size);
              case DistanceUnit.Dpx:
                  return  mediaSize.pixelsToInches(size) / mediaSize.media.devicePixelRatio;
              case DistanceUnit.MM:
                  return size * 25.4;
              case DistanceUnit.Inch:
                  return size;
          }
      }
}