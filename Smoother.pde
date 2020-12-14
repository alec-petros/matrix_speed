class Smoother {
    float rawValue = 0, smoothValue, smoothRate, maxVal, smoothMaxVal, sensitivity, thresh, normVal;

    Smoother(float rate) {
        smoothValue = 0.0;
        smoothRate = rate;
        maxVal = 0.01;
        sensitivity = 1;
        thresh = 0.0;
        smoothMaxVal = 0.5;
        normVal = 0.01;
    }

    void update(float newValue) {
        float normalVal = (float)Math.pow(normalizeValue(newValue), 2);
        rawValue = newValue;

        if (newValue > maxVal) {
            maxVal = newValue;
            smoothMaxVal = newValue;
        }
        
        if (normalVal > smoothValue) {
            smoothValue = normalVal;
        } else {
            smoothValue = (smoothValue * smoothRate) / (smoothRate + 1);
        }
    }

    float value() {
        return rawValue;
    }

    float normalSmoothValue() {
        return (float)Math.pow(smoothValue, 2);
    }

    float normalizeValue(float newValue) {
        return map(newValue, 0, smoothMaxVal / sensitivity, 0, 1);
    }

    float maxVal() {
        return maxVal;
    }
    
    void setSens(float sens) {
      sensitivity = sens;
    }
    
    void setSmooth(float rate) {
      smoothRate = rate;
    }
    
    void setThresh(float newThresh) {
      thresh = newThresh;
    }
}
