
import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io' show Platform;


class SizeMeasure
{
    late final MediaQueryData _mqData;
    late final double pixelsPerInch;
    late final double pixelsPerMM;

    SizeMeasure (BuildContext context)
    {
        _mqData = MediaQuery.of(context);
        pixelsPerInch = /*_mqData.devicePixelRatio **/ ( Platform.isAndroid || Platform.isIOS? 150 : 96);
        pixelsPerMM = pixelsPerInch / 25.4;
    }

    double inchesToPixels(var inches) => pixelsPerInch*inches;

    double pixelsToInches(var pixels) => pixels / pixelsPerInch;

    double mmToPixels(var mm) => pixelsPerMM*mm;

    double pixelsToMM(var pixels) => pixels / pixelsPerMM;
}