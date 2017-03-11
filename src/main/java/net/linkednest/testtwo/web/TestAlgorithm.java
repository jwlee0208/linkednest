package net.linkednest.testtwo.web;

import java.lang.reflect.Array;

public class TestAlgorithm {

    public static int binarySearch(int[] arr, int size, int inputVal){
        int low = 0;
        int high = size - 1; 
        int mid;
        
        while(low <= high){
            mid = (low + high) / 2;
            
            if(arr[mid] > inputVal){
                high = mid - 1;
            } else if(arr[mid] < inputVal){
                low = mid + 1;
            } else{
                return mid;
            }
        }
        return -1;
    }
    
    public static int majority(int[] arr){
        
        int candidate = arr[0];
        int cnt       = 0;
        int size      = arr.length;
        
        for(int attr : arr){
            if(cnt == 0){
                candidate = attr;
                cnt = 1;
            } else if(candidate == attr){
                cnt++;    
            } else {
                cnt--;
            }
        }
        
        cnt = 0;
        for(int attr : arr){
            if(attr == candidate){
                cnt++;
            }
        }

        if(cnt < (size + 1) / 2) return -1;
        
        return candidate;
    }
    
    public static double[] movingAverage(int[] arr, int m){
        double[] ret = new double[10];
        int size = arr.length;
        for(int i = m-1 ; i < size; ++i){
            double partialSum = 0;
            for(int j = 0 ; j < m; ++j){
                partialSum += arr[i-j];
                ret[i+j] = (partialSum / m);
            }
        }
        return ret;
    }
    
    public static void main(String[] args){
        System.out.println("TestAlgorithm.majority(new int[]{1,2,3}) : " + TestAlgorithm.majority(new int[]{1,2,3}));
        System.out.println("TestAlgorithm.majority(new int[]{2,2,3}) : " + TestAlgorithm.majority(new int[]{2,2,3}));
        System.out.println("TestAlgorithm.majority(new int[]{1,2,2,3,3,3}) : " + TestAlgorithm.majority(new int[]{1,2,2,3,3,3}));
        
        double[] result = TestAlgorithm.movingAverage(new int[]{80, 85, 79, 80, 75, 90, 80, 85, 87}, 2);
        for(double dbl : result){
            System.out.println("TestAlgorithm.movingAverage(new int[]{80,85,79, 80,75}, 1) : " + dbl);    
        }
        
        int[] arr = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        int size = arr.length / arr[0];
//        while(true){
//                
//        }
        System.out.println("TestAlgorithm.binarySearch(new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, 2) : " + TestAlgorithm.binarySearch(arr, size, 10));
        
       
    }
}
